# Opentelemetry and Grafana Stack

## Documentations

- [Zero-code Instrumentation](https://opentelemetry.io/docs/zero-code/)
- [Instrument your application with OpenTelemetry](https://help.sumologic.com/docs/apm/traces/get-started-transaction-tracing/opentelemetry-instrumentation/)

## Application Setup

- [Node js](./nodejs.md)

## Setup Opentelemetry

```bash
kubectl apply -f opentel-collector.yaml
```

```bash
kubectl apply -f opentel-instrumentation.yaml
```
