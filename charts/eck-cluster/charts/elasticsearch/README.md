# Elasticsearch (ECK)

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

Deploy ECK compatible elasticsearch resources

This chart allows you to deploy ECK compatible Elasticsearch resources.

**Homepage:** <https://github.com/elastic/cloud-on-k8s>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| SRE | sre@bedag.ch |  |

## Source Code

* <https://github.com/bedag/helm-charts/tree/master/charts/eck-cluster/charts/elasticsearch>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalSettings | object | `{}` | If you can't find the field you want to define for the elasticsearch resource, you can insert it here (see values.yaml for exmaple) |
| annotations | object | `{}` | Annotations applied for the Elasticsearch CRD  |
| auth.fileRealm | object | `{}` | Define FileRealm Provider [Read More](https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-users-and-roles.html#k8s_file_realm) |
| auth.roles | object | `{}` | Defined User Roles  [Read More](https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-users-and-roles.html#k8s_creating_custom_roles) |
| commonLabels | object | `{}` | Common Labels are added to each kubernetes resource manifest. But will not be added to resources rendered by the common chart (eg. JMX Exporter) |
| config | object | `{}` | Elasticsearch Configuration which is merged with each nodeSets configuration |
| image.pullPolicy | string | `""` | Configure Docker Pull Policy. Will be overwritten if set by global variable. |
| image.registry | string | `"docker.elastic.co"` | Configure Docker Registry. Will be overwritten if set by global variable. |
| image.repository | string | `"elasticsearch/elasticsearch"` | Configure Docker Repository |
| image.tag | string | `""` | Configure Docker Image tag |
| ingress.annotations | object | `{}` | Configure Ingress Annotations |
| ingress.apiVersion | string | `""` | Configure the api version used for the ingress resource. |
| ingress.backendHttps | bool | `false` | Sets the `nginx.ingress.kubernetes.io/backend-protocol: "HTTPS"` annotation |
| ingress.customRules | list | `[]` | Configure Custom Ingress [Rules](https://kubernetes.io/docs/concepts/services-networking/ingress/#resource-backend) |
| ingress.enabled | bool | `false` | Enable Ingress Resource |
| ingress.hosts | list | `[]` | Configure Ingress [Hosts](https://kubernetes.io/docs/concepts/services-networking/ingress/#ingress-rules) (Required) |
| ingress.ingressClass | string | `""` | Configure the [default ingress class](https://kubernetes.io/docs/concepts/services-networking/ingress/#default-ingress-class) for this ingress. |
| ingress.labels | object | `{}` | Configure Ingress additional Labels |
| ingress.tls | list | `[]` | Configure Ingress [TLS](https://kubernetes.io/docs/concepts/services-networking/ingress/#tls) |
| ingress.url | string | `"https://elastich"` |  |
| labels | object | `{}` | Labels applied for the Elasticsearch CRD  |
| nodeSets[0].affinity | object | `{}` | Pod [Affinity](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity) |
| nodeSets[0].annotations | object | `{}` | Annotations specific for this nodeSet [Optional] |
| nodeSets[0].apiVersion | string | `""` | Configure the api version used for the Pod resource |
| nodeSets[0].args | object | `{}` | Configure arguments for executed command |
| nodeSets[0].command | object | `{}` | Configure executed container command |
| nodeSets[0].config | object | `{"node.roles":["master","data","ingest","transform"]}` | Elasticsearch Configuration for this nodeSet. Is merged over `$.Values.config`. [Read more](https://www.elastic.co/guide/en/cloud-on-k8s/master/k8s-node-configuration.html) |
| nodeSets[0].containerFields | object | `{}` | Extra fields used on the container definition |
| nodeSets[0].count | int | `1` | Amount of replicas spawned by this nodeSet [Required] |
| nodeSets[0].data.accessModes | list | `["ReadWriteOnce"]` | Configure PVC [Access Modes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#access-modes) |
| nodeSets[0].data.annotations | object | `{}` | Configure PVC additional Annotations ([Monitor Labels](https://www.weave.works/docs/cloud/latest/tasks/monitor/configuration-k8s/)) |
| nodeSets[0].data.dataSource | string | `nil` | Data Sources are currently only supported for [CSI Volumes](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#volume-snapshot-and-restore-volume-from-snapshot-support) |
| nodeSets[0].data.enabled | bool | `true` | Enable PVC Resource |
| nodeSets[0].data.labels | object | `{}` | Merges given labels with common labels |
| nodeSets[0].data.selector | object | `{}` | Configure PVC [Selector](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#selector) |
| nodeSets[0].data.size | string | `"10Gi"` | Configure Persistent Volume Claim Storage Size |
| nodeSets[0].data.storageClass | string | `""` | Configure PVC [Storage Class](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#class-1) |
| nodeSets[0].data.volumeName | string | `""` | Persistent Volume Refference Name |
| nodeSets[0].environment | list | `[]` | Configure Environment Variables (Refer to values.yaml) |
| nodeSets[0].forceRedeploy | bool | `false` |  |
| nodeSets[0].imagePullSecrets | list | `[]` | Define [ImagePullSecrets](https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/). Will be overwritten if set by global variable. |
| nodeSets[0].initContainers | list | `[]` | Pod [initContainers](https://kubernetes.io/docs/concepts/workloads/pods/init-containers/) |
| nodeSets[0].java.opts | string | `""` | Define additional Java Options given to the `ES_JAVA_OPTS` environment variable [Optional] |
| nodeSets[0].java.proxy | bool | `true` | Enable proxy configuration via java arguments |
| nodeSets[0].java.xms | string | `"512m"` | Define Java XMS Value (Xms represents the initial size of total heap space) [Required] |
| nodeSets[0].java.xmx | string | `"512m"` | Define Java XMX Value (Xmx represents the maximum size of total heap space) [Required] |
| nodeSets[0].labels | object | `{"zone":"hot"}` | Labels specific for this nodeSet[Optional] |
| nodeSets[0].lifecycle | object | `{}` | Container [Lifecycle](https://kubernetes.io/docs/concepts/containers/container-lifecycle-hooks/) |
| nodeSets[0].livenessProbe | object | `{}` | Container [LivenessProbe](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/#define-a-liveness-command) |
| nodeSets[0].name | string | `"sample-node"` | Statefulset name for this nodeset [Required] |
| nodeSets[0].nodeSelector | object | `{}` | Pod [NodeSelector](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/) |
| nodeSets[0].podFields | object | `{}` | Add extra field to the [Pod Template](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.18/#podtemplate-v1-core) if not available as value. |
| nodeSets[0].podSecurityContext | object | `{}` | Pod [SecurityContext](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/) |
| nodeSets[0].ports | list | `[]` | Configure Container Ports |
| nodeSets[0].priorityClassName | string | `""` | Pod [priorityClassName](https://kubernetes.io/docs/concepts/configuration/pod-priority-preemption/#priorityclass) |
| nodeSets[0].readinessProbe | object | `{}` | Container [ReadinessProbe](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/#define-readiness-probes) |
| nodeSets[0].resources | object | `{}` | Configure Container [Resource](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/) |
| nodeSets[0].restartPolicy | string | `nil` | Restart policy for all containers within the pod. One of Always, OnFailure, Never. Default to Always. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#restart-policy |
| nodeSets[0].securityContext | object | `{}` | Container [SecurityContext](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/) |
| nodeSets[0].serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| nodeSets[0].serviceAccount.apiVersion | string | v1 | Configure the api version used |
| nodeSets[0].serviceAccount.automountServiceAccountToken | bool | `true` | (bool) AutomountServiceAccountToken indicates whether pods running as this service account should have an API token automatically mounted. |
| nodeSets[0].serviceAccount.create | bool | `false` | Specifies whether a service account should be created |
| nodeSets[0].serviceAccount.enabled | bool | `false` | Specifies whether a service account is enabled or not |
| nodeSets[0].serviceAccount.globalPullSecrets | bool | `false` | Evaluate global set pullsecrets and mount, if set |
| nodeSets[0].serviceAccount.imagePullSecrets | list | `[]` | ImagePullSecrets is a list of references to secrets in the same namespace to use for pulling any images in pods that reference this ServiceAccount. |
| nodeSets[0].serviceAccount.labels | object | `{}` | Merges given labels with common labels |
| nodeSets[0].serviceAccount.name | string | `""` | If not set and create is true, a name is generated using the fullname template |
| nodeSets[0].serviceAccount.secrets | list | `[]` | Secrets is the list of secrets allowed to be used by pods running using this ServiceAccount |
| nodeSets[0].sidecars | list | `[]` | Allows to add sidecars to your [maincar]](https://kubernetes.io/docs/concepts/workloads/pods/#using-pods) |
| nodeSets[0].startupProbe | object | `{}` | Container [StartupProbe](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/#define-startup-probes) |
| nodeSets[0].tolerations | object | `{}` | Pod [Tolerations](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/) |
| nodeSets[0].volumeMounts | list | `[]` | Configure Container [volumeMounts](https://kubernetes.io/docs/tasks/configure-pod-container/configure-volume-storage/) |
| nodeSets[0].volumes | list | `[]` | Additional [Volumes](https://kubernetes.io/docs/concepts/storage/volumes/) |
| nodeSets[1].annotations.annotation | string | `"value"` |  |
| nodeSets[1].config."node.data" | bool | `true` |  |
| nodeSets[1].config."node.ingest" | bool | `true` |  |
| nodeSets[1].config."node.master" | bool | `false` |  |
| nodeSets[1].config."node.ml" | bool | `true` |  |
| nodeSets[1].config."node.remote_cluster_client" | bool | `false` |  |
| nodeSets[1].count | int | `1` |  |
| nodeSets[1].data.accessModes[0] | string | `"ReadWriteOnce"` |  |
| nodeSets[1].data.resources.requests.storage | string | `"10Gi"` |  |
| nodeSets[1].data.storageClassName | string | `"msa-01"` |  |
| nodeSets[1].java.args | list | `[]` |  |
| nodeSets[1].java.xms | string | `"512m"` |  |
| nodeSets[1].java.xmx | string | `"512m"` |  |
| nodeSets[1].labels.zone | string | `"hot"` |  |
| nodeSets[1].name | string | `"sample-node-2"` |  |
| nodeSets[1].nodeSelector."failure-domain.beta.kubernetes.io/zone" | string | `"MSW"` |  |
| nodeSets[1].resources.limits.cpu | string | `"250m"` |  |
| nodeSets[1].resources.limits.memory | string | `"1Gi"` |  |
| nodeSets[1].resources.requests.cpu | string | `"100m"` |  |
| nodeSets[1].resources.requests.memory | string | `"1Gi"` |  |
| overwriteLabels | object | `{}` | Overwrites default labels, but not resource specific labels and common labels |
| plugins | object | `{"args":{},"command":{},"containerFields":{},"enabled":true,"environment":[],"image":{"pullPolicy":null,"registry":"","repository":"","tag":""},"install":["repository-s3"],"lifecycle":{},"livenessProbe":{},"ports":[],"readinessProbe":{},"resources":{},"securityContext":{},"startupProbe":{},"volumeMounts":[]}` | [Reference](https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-init-containers-plugin-downloads.html) |
| plugins.args | object | `{}` | Configure arguments for executed command |
| plugins.command | object | `{}` | Configure executed container command |
| plugins.containerFields | object | `{}` | Extra fields used on the container definition |
| plugins.enabled | bool | `true` | Enable Elasticsearch Plugin Installation |
| plugins.environment | list | `[]` | Configure Environment Variables (Refer to values.yaml) |
| plugins.image | object | `{"pullPolicy":null,"registry":"","repository":"","tag":""}` | Image used to install plugins. Uses by default the value from `$.Values.image`. If you set a image on nodeSet basis this image will also used for the plugins. If you set the image here, it will have precendence over all the other definitions. |
| plugins.image.pullPolicy | string | `nil` | Configure Docker Pull Policy. Will be overwritten if set by global variable. |
| plugins.image.registry | string | `""` | Configure Docker Registry. Will be overwritten if set by global variable. |
| plugins.image.repository | string | `""` | Configure Docker Repository |
| plugins.image.tag | string | Tag defaults to `$.Values.image.tag` | Configure Docker Image tag |
| plugins.install | list | `["repository-s3"]` | List of plugins which will be installed prior to elasticsearch being launched. [See Plugins](https://www.elastic.co/guide/en/elasticsearch/reference/current/modules-plugins.html) |
| plugins.lifecycle | object | `{}` | Container [Lifecycle](https://kubernetes.io/docs/concepts/containers/container-lifecycle-hooks/) |
| plugins.livenessProbe | object | `{}` | Container [LivenessProbe](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/#define-a-liveness-command) |
| plugins.ports | list | `[]` | Configure Container Ports |
| plugins.readinessProbe | object | `{}` | Container [ReadinessProbe](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/#define-readiness-probes) |
| plugins.resources | object | `{}` | Configure Container [Resource](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/) |
| plugins.securityContext | object | `{}` | Container [SecurityContext](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/) |
| plugins.startupProbe | object | `{}` | Container [StartupProbe](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/#define-startup-probes) |
| plugins.volumeMounts | list | `[]` | Configure Container [volumeMounts](https://kubernetes.io/docs/tasks/configure-pod-container/configure-volume-storage/) |
| proxy.httpProxy.host | string | `"blkabla"` | Configure HTTP Proxy Hostname/IP (without protocol://) |
| proxy.httpProxy.port | int | `8080` | (int) Configure HTTP Proxy Port |
| proxy.httpsProxy.host | string | `""` | Configure HTTPS Proxy Hostname/IP (without protocol://) |
| proxy.httpsProxy.port | int | `nil` | Configure HTTPS Proxy Port |
| proxy.noProxy | list | `["localhost","127.0.0.1"]` | Configure No Proxy Hosts |
| secureSettings | list | `[]` | Define secure Settings which are imported into the elasticsearch Keystore [Read More](https://www.elastic.co/guide/en/cloud-on-k8s/master/k8s-es-secure-settings.html) |
| updateStrategy | object | `{}` | [Reference](https://www.elastic.co/guide/en/cloud-on-k8s/current/k8s-update-strategy.html) |
