# Loki Grafana Tempo Mimir

```bash
helm show values lgtm-distributed > values.lgtm-distributed.yaml
```

```bash
helm install lgtm grafana/lgtm-distributed --namespace grafana --create-namespace
```

```bash
helm upgrade --install lgtm grafana/lgtm-distributed --namespace grafana --create-namespace --values values.lgtm-distributed.v2.yaml
```
