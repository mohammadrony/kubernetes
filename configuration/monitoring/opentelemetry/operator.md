# Opentelemetry Operator

```bash
helm upgrade --install opentelemetry-operator open-telemetry/opentelemetry-operator \
  --namespace opentelemetry --create-namespace -f values.ot-operator.yaml
```

Cleanup

```bash
helm uninstall opentelemetry-operator --namespace opentelemetry
```
