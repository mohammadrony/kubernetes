# Grafana Tempo and OpenTelemetry

## Documentations

- [Using OpenTelemetry auto-instrumentation/agents in Kubernetes](https://medium.com/opentelemetry/using-opentelemetry-auto-instrumentation-agents-in-kubernetes-869ec0f42377)
- [Loki OTLP](https://addozhang.medium.com/efficient-application-log-collection-and-analysis-using-opentelemetry-and-loki-baf04bc4a8a2)

## Configure Backend

Install Prometheus

```bash
helm install kube-prometheus-stack prometheus-community/kube-prometheus-stack \
  --namespace monitoring --create-namespace -f values.prometheus.yaml
```

Install Loki

```bash
# helm install loki grafana/loki-stack --namespace monitoring --create-namespace --set promtail.enabled=false
helm install loki grafana/loki-stack --namespace monitoring --create-namespace \
  --set loki.config.limits_config.retention_period=24h --set loki.persistence.enabled=false \
  -f values.loki-stack.yaml
```

Install Tempo

```bash
helm install tempo grafana/tempo --namespace monitoring --create-namespace \
  --set persistence.enabled=false \
  -f values.tempo.yaml
```

## Configure OpenTelemetry

```bash
helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts
helm repo update
```

Install Operator

```bash
helm install opentelemetry-operator open-telemetry/opentelemetry-operator \
  --namespace opentelemetry --create-namespace -f values.opentel-operator.yaml
```

Install Collector

```bash
helm install opentelemetry-collector open-telemetry/opentelemetry-collector \
  --namespace opentelemetry --create-namespace -f values.opentel-collector.yaml
```

Install Instrumentation

```bash
kubectl apply --namespace opentelemetry -f opentel-instrumentation.yaml
```

## Run Application

Set annotation in yaml manifest

```yaml
apiVersion: apps/v1
kind: Deployment
spec:
  template:
    metadata:
      annotations:
        instrumentation.opentelemetry.io/inject-java: "opentelemetry/instrumentation"
        # instrumentation.opentelemetry.io/inject-nodejs: "opentelemetry/instrumentation"
        # instrumentation.opentelemetry.io/inject-python: "opentelemetry/instrumentation"
        # instrumentation.opentelemetry.io/inject-go: "opentelemetry/instrumentation"
        # instrumentation.opentelemetry.io/inject-dotenv: "opentelemetry/instrumentation"
```

Set annotation by command

```bash
# Java
kubectl patch deployment/DEPLOYMENT_NAME -p '{"spec": {"template": {"metadata": {"annotations": {"instrumentation.opentelemetry.io/inject-java": "opentelemetry/instrumentation"}}}}}'

# NodeJS
kubectl patch deployment/DEPLOYMENT_NAME -p '{"spec": {"template": {"metadata": {"annotations": {"instrumentation.opentelemetry.io/inject-nodejs": "opentelemetry/instrumentation"}}}}}'

# Python
kubectl patch deployment/DEPLOYMENT_NAME -p '{"spec": {"template": {"metadata": {"annotations": {"instrumentation.opentelemetry.io/inject-python": "opentelemetry/instrumentation"}}}}}'

# Go
kubectl patch deployment/DEPLOYMENT_NAME -p '{"spec": {"template": {"metadata": {"annotations": {"instrumentation.opentelemetry.io/inject-go": "opentelemetry/instrumentation"}}}}}'

# Dotenv
kubectl patch deployment/DEPLOYMENT_NAME -p '{"spec": {"template": {"metadata": {"annotations": {"instrumentation.opentelemetry.io/inject-dotenv": "opentelemetry/instrumentation"}}}}}'
```

## Configure Grafana

Install Grafana

```bash
helm install grafana grafana/grafana --namespace monitoring --create-namespace \
  --set persistence.enabled=false \
 -f values.grafana.yaml
```
