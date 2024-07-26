# Grafana Alloy

- [Grafana Alloy](https://grafana.com/docs/alloy/latest/)
- [Collect and forward data with Grafana Alloy](https://grafana.com/docs/alloy/latest/collect/)

```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
```

Mimir

```bash
helm show values grafana/mimir-distributed > values.mimir-distributed.yaml
```

```bash
helm install mimir grafana/mimir-distributed --namespace alloy --create-namespace
```

```bash
helm upgrade --install mimir grafana/mimir-distributed --namespace alloy -f values.mimir-distributed.v2.yaml
```

Loki

```bash
helm show values grafana/loki-simple-scalable > values.loki-simple-scalable.yaml
```

```bash
helm upgrade --install loki grafana/loki-simple-scalable --namespace alloy -f values.loki-simple-scalable.v2.yaml
```

```bash
helm install loki grafana/loki-simple-scalable --namespace alloy --create-namespace
```

Tempo

```bash
helm show values grafana/tempo-distributed > values.tempo-distributed.yaml
```

```bash
helm install tempo grafana/tempo-distributed --namespace alloy --create-namespace
```

```bash
helm upgrade --install tempo grafana/tempo-distributed --namespace alloy -f values.tempo-distributed.v2.yaml
```

Alloy

```bash
helm show values grafana/alloy > values.alloy.yaml
```

```bash
helm install alloy grafana/alloy --namespace alloy --create-namespace
```

```bash
helm upgrade --install alloy grafana/alloy --namespace alloy -f values.alloy.v2.yaml
```

Grafana

| Type    | Data source                                   |
|---------|-----------------------------------------------|
| Metrics | `http://mimir-nginx.alloy.svc:80/prometheus`  |
