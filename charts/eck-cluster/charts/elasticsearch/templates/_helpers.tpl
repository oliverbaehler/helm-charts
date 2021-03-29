{{/*
  Merge Global and Per Nodeset ES Configuration
*/}}
{{- define "es.config" -}}
{{- toYaml (merge (default dict .context.Values.config) (default dict .config)) }}
{{- end -}}

{{/*
  Pod Template for Elasticsearch Container
*/}}
{{- define "es.podTemplate" -}}
podLabels: {{- toYaml .node.labels | nindent 2 }}
podAnnotations: {{- toYaml .node.annotations | nindent 2 }}
image: {{ toYaml .context.Values.image | nindent 2}}
initContainers:
  {{- if .context.Values.plugins.enabled }}
  - {{ include "bedag-lib.template.container" (dict "container" (fromYaml (include "es.initContainer.plugins" .)) "context" .context) | nindent 4 }}
  {{- end }}
environment:
 - name: ES_JAVA_OPTS
   value: '-Xms{{ required "Field .node.java.xms is required!" .node.java.xms }} -Xmx{{ required "Field .node.java.xmx is required!" .node.java.xmx }} {{ if .node.java.proxy }} {{ include "bedag-lib.utils.helpers.javaProxies" (dict "proxy" .context.Values.global.proxy "context" .context ) }} {{ end }} {{ if .node.java.opts }} {{ .node.java.opts }} {{ end }}'
{{- end -}}

{{/*
  Plugin Installer Init Container
*/}}
{{- define "es.initContainer.plugins" -}}
name: install-plugins
image: {{ toYaml (mergeOverwrite .context.Values.image (default dict .node.image) (default dict .context.Values.plugins.image)) | nindent 2}}
command:
  - sh
  - "-c"
  - |
      {{- range .context.Values.plugins.install }}
      bin/elasticsearch-plugin install --batch {{ . }}
      {{- end }}
{{- end -}}

