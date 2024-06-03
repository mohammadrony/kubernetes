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
