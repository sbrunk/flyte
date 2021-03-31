{{/* vim: set filetype=mustache: */}}

{{- define "flyte.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "flyte.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "flyte.namespace" -}}
{{- default .Release.Namespace .Values.forceNamespace | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{- define "flyteadmin.name" -}}
flyteadmin
{{- end -}}

{{- define "flyteadmin.selectorLabels" -}}
app.kubernetes.io/name: {{ template "flyteadmin.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "flyteadmin.labels" -}}
{{ include "flyteadmin.selectorLabels" . }}
helm.sh/chart: {{ include "flyte.chart" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}


{{- define "datacatalog.name" -}}
datacatalog
{{- end -}}

{{- define "datacatalog.selectorLabels" -}}
app.kubernetes.io/name: {{ template "datacatalog.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "datacatalog.labels" -}}
{{ include "datacatalog.selectorLabels" . }}
helm.sh/chart: {{ include "flyte.chart" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}


{{- define "flytepropeller.name" -}}
flytepropeller
{{- end -}}

{{- define "flytepropeller.selectorLabels" -}}
app.kubernetes.io/name: {{ template "flytepropeller.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "flytepropeller.labels" -}}
{{ include "flytepropeller.selectorLabels" . }}
helm.sh/chart: {{ include "flyte.chart" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}


{{- define "flyteconsole.name" -}}
flyteconsole
{{- end -}}

{{- define "flyteconsole.selectorLabels" -}}
app.kubernetes.io/name: {{ template "flyteconsole.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "flyteconsole.labels" -}}
{{ include "flyteconsole.selectorLabels" . }}
helm.sh/chart: {{ include "flyte.chart" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}


{{- define "redis.name" -}}
redis
{{- end -}}

{{- define "redis.selectorLabels" -}}
app.kubernetes.io/name: {{ template "redis.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "redis.labels" -}}
{{ include "redis.selectorLabels" . }}
helm.sh/chart: {{ include "flyte.chart" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}


{{- define "postgres.name" -}}
postgres
{{- end -}}

{{- define "postgres.selectorLabels" -}}
app.kubernetes.io/name: {{ template "postgres.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "postgres.labels" -}}
{{ include "postgres.selectorLabels" . }}
helm.sh/chart: {{ include "flyte.chart" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}


{{- define "minio.name" -}}
minio
{{- end -}}

{{- define "minio.selectorLabels" -}}
app.kubernetes.io/name: {{ template "minio.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "minio.labels" -}}
{{ include "minio.selectorLabels" . }}
helm.sh/chart: {{ include "flyte.chart" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "pytorch-operator.name" -}}
pytorch-operator
{{- end -}}

{{- define "pytorch-operator.namespace" -}}
pytorch-operator
{{- end -}}

{{- define "pytorch-operator.selectorLabels" -}}
app.kubernetes.io/name: {{ template "pytorch-operator.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "pytorch-operator.labels" -}}
{{ include "pytorch-operator.selectorLabels" . }}
helm.sh/chart: {{ include "flyte.chart" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

# Optional blocks for secret mount 

{{- define "databaseSecret.volume" -}}
{{- with .Values.common.databaseSecret.name -}}
- name: {{ . }}
  secret:
    secretName: {{ . }}
{{- end }}
{{- end }}

{{- define "databaseSecret.volumeMount" -}}
{{- with .Values.common.databaseSecret.name -}}
- mountPath: /etc/db
  name: {{ . }}
{{- end }}
{{- end }}
