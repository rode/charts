![Release Charts](https://github.com/rode/charts/workflows/Release%20Charts/badge.svg) ![Test Charts](https://github.com/rode/charts/workflows/Test%20Charts/badge.svg)

# Rode Helm Charts

This repository contains Helm charts for several tools in the Rode ecosystem.

| Name | Chart | Project |
| ---- | ----- | ------- |
| Rode | [/charts/rode](https://github.com/rode/charts/tree/main/charts/rode) | [rode/rode](https://github.com/rode/rode) |  
| Rode UI | [/charts/rode-ui](https://github.com/rode/charts/tree/main/charts/rode-ui) | [rode/rode-ui](https://github.com/rode/rode-ui) |
| Rode Harbor Collector | [/charts/rode-collector-harbor](https://github.com/rode/charts/tree/main/charts/rode-collector-harbor) | [rode/collector-harbor](https://github.com/rode/collector-harbor) |
| Rode Build Collector | [/charts/collector-build](https://github.com/rode/charts/tree/main/charts/rode-collector-build) | [rode/collector-build](https://github.com/rode/collector-build) |
| Rode tfsec Collector | [/charts/rode-collector-tfsec](https://github.com/rode/charts/tree/main/charts/rode-collector-tfsec) | [rode/collector-tfsec](https://github.com/rode/collector-tfsec) |
| Rode Kubernetes Enforcer | [/charts/enforcer-k8s](https://github.com/rode/charts/tree/main/charts/enforcer-k8s) | [rode/enforcer-k8s](https://github.com/rode/enforcer-k8s) |
| Grafeas Elasticsearch | [/charts/grafeas-elasticsearch](https://github.com/rode/charts/tree/main/charts/grafeas-elasticsearch) | [rode/grafeas-elasticsearch](https://github.com/rode/grafeas-elasticsearch) |


## Contributing

We use the Helm [Chart Testing](https://github.com/helm/chart-testing) tool to lint and test changes.

### Lint charts locally

*requirements*
- docker

You can lint changes to the charts locally by running `make test` which runs the chart testing tool in a container.

### Install charts locally

*requirements*
- Helm [Chart Testing](https://github.com/helm/chart-testing) binary
- Local Kubernetes cluster (Docker for Desktop, Kind, etc)

You can test installing the charts into a local Kubernetes cluster by running `ct install --all`