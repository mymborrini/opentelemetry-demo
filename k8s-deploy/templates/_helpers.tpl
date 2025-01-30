
{{/*
Orders
*/}}
{{- define "k8s-deploy.orders.backend.name" -}}
{{- default .Chart.Name .Values.orders.name | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "k8s-deploy.orders.backend.labels" -}}
{{ include "k8s-deploy.common.labels" . }}
{{ include "k8s-deploy.orders.backend.selectorLabels" . }}
{{- end }}

{{- define "k8s-deploy.orders.backend.selectorLabels" -}}
app.kubernetes.io/name: {{ include "k8s-deploy.orders.backend.name" . }}
{{ include "k8s-deploy.common.selectorLabels" . }}
{{- end }}


{{- define "k8s-deploy.orders.backend.config" -}}
{{- default .Chart.Name .Values.orders.name "config" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Postgres
*/}}
{{- define "k8s-deploy.postgres.backend.name" -}}
{{- default .Chart.Name "db-postgres" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "k8s-deploy.postgres.backend.labels" -}}
{{ include "k8s-deploy.common.labels" . }}
{{ include "k8s-deploy.postgres.backend.selectorLabels" . }}
{{- end }}

{{- define "k8s-deploy.postgres.backend.selectorLabels" -}}
app.kubernetes.io/name: {{ include "k8s-deploy.postgres.backend.name" . }}
{{ include "k8s-deploy.common.selectorLabels" . }}
{{- end }}

{{- define "k8s-deploy.postgres.backend.config" -}}
{{- default .Chart.Name .Values.postgres.name "config" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Collector
*/}}
{{- define "k8s-deploy.collector.name" -}}
{{- default .Chart.Name "otel-collector" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "k8s-deploy.collector.grpc.endpoint" -}}
{{- default .Chart.Name "otel-collector-grpc" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "k8s-deploy.collector.prometheus.endpoint" -}}
{{- default .Chart.Name "otel-collector-prometheus" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "k8s-deploy.collector.labels" -}}
{{ include "k8s-deploy.common.labels" . }}
{{ include "k8s-deploy.collector.selectorLabels" . }}
{{- end }}

{{- define "k8s-deploy.collector.selectorLabels" -}}
app.kubernetes.io/name: {{ include "k8s-deploy.collector.name" . }}
{{ include "k8s-deploy.common.selectorLabels" . }}
{{- end }}

{{- define "k8s-deploy.collector.config" -}}
{{- default .Chart.Name .Values.collector.name "config" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Prometheus
*/}}
{{- define "k8s-deploy.prometheus.name" -}}
{{- default .Chart.Name "prometheus" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "k8s-deploy.prometheus.labels" -}}
{{ include "k8s-deploy.common.labels" . }}
{{ include "k8s-deploy.prometheus.selectorLabels" . }}
{{- end }}

{{- define "k8s-deploy.prometheus.selectorLabels" -}}
app.kubernetes.io/name: {{ include "k8s-deploy.prometheus.name" . }}
{{ include "k8s-deploy.common.selectorLabels" . }}
{{- end }}

{{- define "k8s-deploy.prometheus.config" -}}
{{- default .Chart.Name .Values.prometheus.name "config" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Loki
*/}}
{{- define "k8s-deploy.loki.name" -}}
{{- default .Chart.Name "loki" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "k8s-deploy.loki.labels" -}}
{{ include "k8s-deploy.common.labels" . }}
{{ include "k8s-deploy.loki.selectorLabels" . }}
{{- end }}

{{- define "k8s-deploy.loki.selectorLabels" -}}
app.kubernetes.io/name: {{ include "k8s-deploy.loki.name" . }}
{{ include "k8s-deploy.common.selectorLabels" . }}
{{- end }}

{{- define "k8s-deploy.loki.config" -}}
{{- default .Chart.Name .Values.loki.name "config" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Grafana
*/}}
{{- define "k8s-deploy.grafana.name" -}}
{{- default .Chart.Name "grafana" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "k8s-deploy.grafana.labels" -}}
{{ include "k8s-deploy.common.labels" . }}
{{ include "k8s-deploy.grafana.selectorLabels" . }}
{{- end }}

{{- define "k8s-deploy.grafana.selectorLabels" -}}
app.kubernetes.io/name: {{ include "k8s-deploy.grafana.name" . }}
{{ include "k8s-deploy.common.selectorLabels" . }}
{{- end }}

{{- define "k8s-deploy.grafana.config" -}}
{{- default .Chart.Name .Values.grafana.name "config" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{/*
Common
*/}}
{{- define "k8s-deploy.common.labels" -}}
helm.sh/chart: {{ .Chart.Name | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "k8s-deploy.common.selectorLabels"}}
app.kubernetes.io/namespace: {{ .Release.Namespace }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "k8s-deploy.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default .Chart.Name .Values.serviceAccount.name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}