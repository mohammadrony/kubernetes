# Opentelemetry Log Monitoring with Grafana

## Opentelemetry Setup

```bash
helm upgrade --install opentelemetry-collector open-telemetry/opentelemetry-collector \
  --namespace opentelemetry --create-namespace --values values.opentel-collector-logs.yaml
```

```bash
helm upgrade --install opentelemetry-collector open-telemetry/opentelemetry-collector \
  --namespace opentelemetry --create-namespace --values values.opentel-collector.yaml
```

```bash
kubectl apply -f opentel-collector.yaml
```

Full manifest from [source](https://github.com/open-telemetry/opentelemetry-collector-contrib/blob/main/examples/kubernetes/otel-collector.yaml). Change [collector](./otel-collector.yaml) with required values.

## Grafana Setup

```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
```

```bash
helm install tempo grafana/tempo-distributed --namespace monitoring --create-namespace -f values.tempo-distributed.yaml
```

```bash
helm install grafana grafana/grafana --namespace monitoring --create-namespace \
  --set persistence.enabled=false \
  -f values.grafana.yaml
```
