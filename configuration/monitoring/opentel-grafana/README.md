# Monitoring with Opentelemetry and Grafana

## Opentelemetry

Operator Install ([release](https://github.com/open-telemetry/opentelemetry-operator/releases/latest/download/opentelemetry-operator.yaml))

```bash
kubectl apply -f opentel-operator.yaml
```

Collector Install

```bash
kubectl apply -f opentel-collector.yaml
```

## Deployment

```bash
# Java
kubectl patch deployment/DEPLOYMENT_NAME -p '{"spec": {"template": {"metadata": {"annotations": {"instrumentation.opentelemetry.io/inject-java": "opentelemetry/instrumentation"}}}}}'

# NodeJS
kubectl patch deployment/DEPLOYMENT_NAME -p '{"spec": {"template": {"metadata": {"annotations": {"instrumentation.opentelemetry.io/inject-nodejs": "opentelemetry/instrumentation"}}}}}'
```

## Grafana

```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
```

```bash
helm install tempo grafana/tempo --namespace monitoring --create-namespace \
  --set persistence.enabled=false \
  -f values.tempo.yaml
```

```bash
helm install grafana grafana/grafana --namespace monitoring --create-namespace \
  --set persistence.enabled=false \
  -f values.grafana.yaml
```
