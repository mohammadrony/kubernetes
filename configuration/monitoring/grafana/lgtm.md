# Loki Grafana Tempo Mimir

## Combined Chart

```bash
helm show values lgtm-distributed > values/lgtm-distributed.orig.yaml
```

```bash
helm install lgtm-distributed grafana/lgtm-distributed --namespace grafana --create-namespace
```

```bash
helm upgrade --install lgtm-distributed grafana/lgtm-distributed --namespace grafana --create-namespace --values values/lgtm-distributed.yaml
```

## Individual Charts

Mimir

```bash
helm show values grafana/mimir-distributed > values/mimir-distributed.orig.yaml
```

```bash
helm install mimir-distributed grafana/mimir-distributed --namespace grafana --create-namespace
```

```bash
helm upgrade --install mimir-distributed grafana/mimir-distributed --namespace grafana -f values/mimir-distributed.yaml
```

Loki

```bash
helm show values grafana/loki-distributed > values/loki-distributed.orig.yaml
```

```bash
helm upgrade --install loki-distributed grafana/loki-distributed --namespace grafana -f values/loki-distributed.yaml
```

```bash
helm install loki-distributed grafana/loki-distributed --namespace grafana --create-namespace
```

Tempo

```bash
helm show values grafana/tempo-distributed > values/tempo-distributed.orig.yaml
```

```bash
helm install tempo-distributed grafana/tempo-distributed --namespace grafana --create-namespace
```

```bash
helm upgrade --install tempo-distributed grafana/tempo-distributed --namespace grafana -f values/tempo-distributed.yaml
```

Grafana

| Type    | Data source                                                 |
|---------|-------------------------------------------------------------|
| Metrics | `http://mimir-distributed-nginx.grafana.svc:80/prometheus`  |

## Cleanup

```bash
helm uninstall lgtm-distributed -n grafana
```

```bash
helm uninstall mimir-distributed -n grafana
```

```bash
helm uninstall loki-distributed -n grafana
```

```bash
helm uninstall tempo-distributed -n grafana
```
