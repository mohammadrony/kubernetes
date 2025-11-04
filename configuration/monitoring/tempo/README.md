# Opentelemetry and Grafana Stack

## Documentations

- [Zero-code Instrumentation](https://opentelemetry.io/docs/zero-code/)
- [Instrument your application with OpenTelemetry](https://help.sumologic.com/docs/apm/traces/get-started-transaction-tracing/opentelemetry-instrumentation/)
- [Loki Helm Documentation Isn’t Working](https://community.grafana.com/t/loki-helm-documentation-isnt-working-for-me/122777)

## Application Setup

- [Node js](./nodejs.md)

## Grafana Setup

```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
```

```bash
helm install tempo grafana/tempo --namespace grafana --create-namespace -f values.tempo.yaml
```

```bash
kubectl apply -f local-pv.yaml
```

```bash
helm install loki grafana/loki --namespace grafana --create-namespace -f values.loki.yaml
```

```bash
helm install grafana grafana/grafana --namespace grafana --create-namespace \
  --set persistence.enabled=false \
  -f values.grafana.yaml
```
