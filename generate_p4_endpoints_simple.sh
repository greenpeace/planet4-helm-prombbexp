#!/usr/bin/env bash
#set -x
set -euo pipefail

kubectx gke_planet-4-151612_us-central1-a_p4-development
gcloud config set project planet-4-151612
for i in $(kubectl get pods -n develop | grep -m 100 openresty | \
      awk -F '-wordpress' '{print $1}' | cut -c 9-| sort -u)
    do
      echo " $i ..."
      url=$(kubectl get ingress -n develop planet4-"$i"-wordpress-openresty \
        -o=jsonpath='{.spec.rules[:1].host}{.spec.rules[:1].http.paths[:1].path}')
      echo "    - name: develop-$i" >> dev.txt
      echo -e "      url: https://$url" >> dev.txt
done

kubectx gke_planet4-production_us-central1-a_planet4-production
gcloud config set project planet4-production
for i in $(kubectl get deployment -A | grep release-wordpress | grep -m 100 openresty | \
      awk -F '-wordpress' '{print $1}' | cut -c 29-| sort -u)
    do
      echo " $i ..."
      ns=$(kubectl get pods -A | grep -w "$i" |cut -d' ' -f1 | sort -u )
      url=$(kubectl get ingress -n "$ns" planet4-"$i"-wordpress-openresty \
        -o=jsonpath='{.spec.rules[:1].host}{.spec.rules[:1].http.paths[:1].path}')
      echo "    - name: $i" >> prod.txt
      echo -e "      url: https://$url" >> prod.txt
done

for i in $(kubectl get deployment -A | grep master-wordpress | grep -m 100 openresty | \
      awk -F '-wordpress' '{print $1}' | cut -c 29-| sort -u)
    do
      echo " $i ..."
      ns=$(kubectl get pods -A | grep -w "$i" |cut -d' ' -f1 | sort -u )
      url=$(kubectl get ingress -n "$ns" planet4-"$i"-wordpress-openresty \
        -o=jsonpath='{.spec.rules[:1].host}{.spec.rules[:1].http.paths[:1].path}')
      echo "    - name: $i" >> prod.txt
      echo -e "      url: https://$url" >> prod.txt
done