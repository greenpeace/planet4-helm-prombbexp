[![Greenpeace](https://circleci.com/gh/greenpeace/planet4-helm-prombbexp.svg?style=shield)](https://circleci.com/gh/greenpeace/planet4-helm-prombbexp)

![Planet4](./p4logo.png)
# Prometheus Blackbox Exporter 

The blackbox exporter allows blackbox probing of endpoints over HTTP, HTTPS, DNS, TCP and ICMP.  Used to monitor P4 end points via Grafana.

<h1>Important Notes</h1>

>Ensure compatibility with:
- [Prometheus](https://github.com/greenpeace/planet4-helm-prometheus) 


***
### Requirements - Internal Only
-   Access to P4 Infra [environment](https://www.notion.so/p4infra/bab9d0b1f2db4d929a59916899d531c1?v=eca7b78e1ae345c6883a9b37c6b76cac)

### Built with
- [Prometheus Blackbox exporter](https://github.com/prometheus-community/helm-charts/tree/main/charts/prometheus-blackbox-exporter) helm chart

### Deployment
This repository is deployed via [CircleCI](https://circleci.com/gh/greenpeace/planet4-helm-prombbexp)

 - Commits to the develop branch trigger deployment to the development cluster.  
 - Create a PR for review to prepare for production deployment.
 - Approval and merge deploys to production.

### Usage
 - To generate endpoint yaml files run:
    `generate_p4_endpoints_file.sh` -  Enter env, get env file, copy to yaml </em>
 - To access probe results visit:
     [Grafana](https://grafana.greenpeace.org/d/EmUBHUFGk/p4-probe-monitoring?orgId=1&var-target=https:%2F%2Fwww-dev.greenpeace.org%2Fjctest%2F&var-http_job=promblackboxex-prometheus-blackbox-exporter&var-icmp_job=website-monitoring-icmp&from=1617594131541&to=1617595931546)
 - Clone the repo to access makefile commands via cli that are not executed via CircleCI
   - `make status` - <em> display status of named release </em>
   - `make value` - <em> display user values followed by all values deployed </em>
   - `make history` - <em> display deployment history of named release </em>
   - `make uninstall` - <em> delete release while retaining history, CRDs, PVs etc.</em>
   - `make destroy` - <em> destroy release including CRDs, PVs etc. </em> <strong> CAUSES DATA LOSS </strong>

 ### Infra Documentation
 - External
   - [Planet 4 Handbook](https://app.gitbook.com/@greenpeace/s/planet4/infrastructure/intro)
 - Internal use only
   - [P4 Notion](https://www.notion.so/p4infra/)

 ### Contributing
 If your interested in contributing to P4 Infrastructure code please check our our community page [here](https://github.com/greenpeace/planet4).
