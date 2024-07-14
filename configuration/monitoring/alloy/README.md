# Grafana Alloy

[Collect and forward data with Grafana Alloy](https://grafana.com/docs/alloy/latest/collect/)

```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
```

```bash
helm show values grafana/alloy > values.alloy.yaml
```

```bash
helm install alloy grafana/alloy --namespace alloy --create-namespace
```

```bash
helm upgrade --install alloy grafana/alloy --namespace alloy -f values.alloy.v2.yaml
```
