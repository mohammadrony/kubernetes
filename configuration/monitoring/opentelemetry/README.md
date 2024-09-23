# Opentelemetry

Configuration


Concept

- AlwaysOn: sampler samples every trace, for example, a new trace will be started and exported for every request.
- AlwaysOff: sampler samples no traces or, in other words, drops all traces. You can use this sampler to perform load testing or to temporarily disable tracing.

## Operator

```bash
helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts
helm repo update
```

```bash
helm show values open-telemetry/opentelemetry-operator > values.ot-operator.orig.yaml
```

```bash
helm upgrade --install opentelemetry-operator open-telemetry/opentelemetry-operator \
  --namespace opentelemetry --create-namespace -f values.ot-operator.yaml
```

## Collector

```bash
# kubectl apply -f ot-collector.yaml
```

```bash
helm upgrade --install opentelemetry-collector open-telemetry/opentelemetry-collector \
  --namespace opentelemetry --create-namespace -f values.ot-collector.yaml
```

## Instrumentation

Java

```bash
kubectl apply -f java-instrumentation.yaml
```

Node.js

```bash
kubectl apply -f nodejs-instrumentation.yaml
```

Annotation

- [Deployment annotation](./deployment-annotation.sh)

## Cleanup

```bash
helm uninstall opentelemetry-operator --namespace opentelemetry
```

```bash
helm uninstall opentelemetry-collector --namespace opentelemetry
```
