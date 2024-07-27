# Loki Grafana Tempo Mimir

## Combined Chart

```bash
helm show values lgtm-distributed > values/lgtm-distributed.orig.yaml
```

```bash
helm install lgtm grafana/lgtm-distributed --namespace grafana --create-namespace
```

```bash
helm upgrade --install lgtm grafana/lgtm-distributed --namespace grafana --create-namespace --values values/lgtm-distributed.yaml
```

## Individual Charts

Mimir

```bash
helm show values grafana/mimir-distributed > values/mimir-distributed.orig.yaml
```

```bash
helm install mimir grafana/mimir-distributed --namespace alloy --create-namespace
```

```bash
helm upgrade --install mimir grafana/mimir-distributed --namespace alloy -f values/mimir-distributed.yaml
```

Loki

```bash
helm show values grafana/loki-simple-scalable > values/loki-distributed.orig.yaml
```

```bash
helm upgrade --install loki grafana/loki-simple-scalable --namespace alloy -f values/loki-distributed.yaml
```

```bash
helm install loki grafana/loki-simple-scalable --namespace alloy --create-namespace
```

Tempo

```bash
helm show values grafana/tempo-distributed > values/tempo-distributed.orig.yaml
```

```bash
helm install tempo grafana/tempo-distributed --namespace alloy --create-namespace
```

```bash
helm upgrade --install tempo grafana/tempo-distributed --namespace alloy -f values/tempo-distributed.yaml
```

Grafana

| Type    | Data source                                   |
|---------|-----------------------------------------------|
| Metrics | `http://mimir-nginx.alloy.svc:80/prometheus`  |
