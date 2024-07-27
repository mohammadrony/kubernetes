# Grafana Alloy

- [Grafana Alloy](https://grafana.com/docs/alloy/latest/)
- [Collect and forward data with Grafana Alloy](https://grafana.com/docs/alloy/latest/collect/)

```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
```

Alloy

```bash
helm show values grafana/alloy > values/alloy.orig.yaml
```

```bash
helm install alloy grafana/alloy --namespace grafana --create-namespace
```

```bash
helm upgrade --install alloy grafana/alloy --namespace grafana -f values/alloy.yaml
```
