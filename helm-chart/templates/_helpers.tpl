{{- define "docker-pipeline-demo.fullname" -}}
{{- printf "%s" .Chart.Name -}}
{{- end -}}

{{- define "docker-pipeline-demo.labels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "docker-pipeline-demo.selectorLabels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "docker-pipeline-demo.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
{{ .Values.serviceAccount.name | default (include "docker-pipeline-demo.fullname" .) }}
{{- else -}}
default
{{- end -}}
{{- end -}}
