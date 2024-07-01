# Monitoring with Opentelemetry and Grafana (Tracing)

## Opentelemetry

Operator Install ([release](https://github.com/open-telemetry/opentelemetry-operator/releases/latest/download/opentelemetry-operator.yaml))

```bash
kubectl apply -f opentel-operator.yaml
```

Collector Install

```bash
kubectl apply -f opentel-collector.yaml
```

Instrumentation

```bash
kubectl apply -f opentel-instrumentation.yaml
```

## Deployment

```bash
# Java
kubectl patch deployment/DEPLOYMENT_NAME --namespace NAMESPACE --patch '{"spec": {"template": {"metadata": {"annotations": {"instrumentation.opentelemetry.io/inject-java": "opentelemetry/instrumentation"}}}}}'

# NodeJS
kubectl patch deployment/DEPLOYMENT_NAME --namespace NAMESPACE --patch '{"spec": {"template": {"metadata": {"annotations": {"instrumentation.opentelemetry.io/inject-nodejs": "opentelemetry/instrumentation"}}}}}'
```

## Grafana

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

Expose Grafana

```bash
# kubectl patch service grafana -n monitoring --patch '{"spec": {"ports": {"NodePort": 30000}, "type": NodePort}}'
kubectl patch service grafana -n monitoring --type='json' -p='[{"op": "replace", "path": "/spec/type", "value": "NodePort" }, {"op": "replace", "path": "/spec/ports/0/nodePort", "value": 30000 }]'
```
