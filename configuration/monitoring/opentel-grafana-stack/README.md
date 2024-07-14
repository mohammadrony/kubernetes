# Opentelemetry and Grafana Stack

## Documentations

- [Zero-code Instrumentation](https://opentelemetry.io/docs/zero-code/)
- [Instrument your application with OpenTelemetry](https://help.sumologic.com/docs/apm/traces/get-started-transaction-tracing/opentelemetry-instrumentation/)

## Application Setup

- [Node js](./nodejs.md)

## Setup Opentelemetry

```bash
helm upgrade --install opentelemetry-operator open-telemetry/opentelemetry-operator \
  --namespace opentelemetry --create-namespace -f values.ot-operator.yaml
```

```bash
kubectl apply -f ot-collector.yaml
```

```bash
# helm upgrade --install opentelemetry open-telemetry/opentelemetry-collector \
#   --namespace opentelemetry --create-namespace -f values.ot-collector.yaml
```

```bash
kubectl apply -f ot-instrumentation.yaml
```

## Grafana Setup

```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
```

```bash
helm install tempo grafana/tempo-distributed --namespace monitoring --create-namespace -f values.tempo-distributed.yaml
```

```bash
# kubectl apply -f local-pv.yaml
```

```bash
helm install loki grafana/loki --namespace monitoring --create-namespace -f values.loki.yaml
```

```bash
helm install grafana grafana/grafana --namespace monitoring --create-namespace \
  --set persistence.enabled=false \
  -f values.grafana.yaml
```
