# eck-cluster

![Version: 2.2.0](https://img.shields.io/badge/Version-2.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.3.0](https://img.shields.io/badge/AppVersion-1.3.0-informational?style=flat-square)

ECK Cluster Chart

**Homepage:** <https://github.com/elastic/cloud-on-k8s>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| SRE | sre@bedag.ch |  |

## Source Code

* <https://github.com/bedag/helm-charts/tree/master/charts/eck-cluster>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
|  | elasticsearch | >0.0.0-0 |
| https://bedag.github.io/helm-charts/ | manifests | >=0.4.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| apm.enabled | bool | `false` | Enable apm Subchart (Deploy ECK compatible apm resources) |
| elasticsearch.enabled | bool | `true` | Enable Elasticsearch Subchart (Deploy ECK compatible Elasticsearch resources) |
| extraResources | list | `[]` | Enter Extra Resources managed by the ECK-Cluster Release |
| global.cluster.name | string | `"logmanagement"` | Define the cluster name which will be used for all enabled resources |
| global.cluster.version | string | `"7.12.0"` | Define the docker image tag verison which will be used for all containers |
| global.common.proxy.httpProxy.host | string | `"test"` |  |
| global.common.proxy.httpProxy.port | int | `8080` |  |
| global.common.proxy.httpProxy.protocol | string | `""` |  |
| global.common.proxy.httpsProxy.host | string | `""` |  |
| global.common.proxy.httpsProxy.port | string | `nil` |  |
| global.common.proxy.httpsProxy.protocol | string | `""` |  |
| global.common.proxy.noProxy | list | `[]` |  |
| global.imagePullPolicy | string | `""` | Global Docker Image Pull Policy declaration. Will overwrite all child .pullPolicy fields. |
| global.imagePullSecrets | list | `[]` | Global Docker Image Pull Secrets declaration. Added to local Docker Image Pull Secrets. |
| global.imageRegistry | string | `""` | Global Docker Image Registry declaration. Will overwrite all child .registry fields. |
| global.labels | object | `{"test":"test"}` | Labels which are merged  |
| global.storageClass | string | `""` | Global StorageClass declaration. Can be used to overwrite StorageClass fields. |
| kibana.enabled | bool | `false` | Enable Kibana Subchart (Deploy ECK compatible Kibana resources) |
| persistentVolumes | list | `[]` | Define extra Volumes which will be managed by the release |
