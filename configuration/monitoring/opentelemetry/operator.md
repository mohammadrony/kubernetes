# Opentelemetry Operator

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

Cleanup

```bash
helm uninstall opentelemetry-operator --namespace opentelemetry
```
