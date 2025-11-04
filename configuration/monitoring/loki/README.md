# Loki Stack and Prometheus

## Documentation

- [Log Management and Distributed Tracing using Grafana Loki and Tempo](https://blog.cloudtechner.com/log-management-and-distributed-tracing-using-grafana-loki-and-tempo-b9c56392bae7)
- [Kubernetes Observability Using Loki, Cortex, Tempo and Grafana](https://invisibl.io/kubernetes-observability-loki-cortex-tempo-prometheus-grafana/?amp=1)

## Install Loki stack

```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
```

```bash
kubectl apply -f loki-pv.yaml
```

```bash
helm show values grafana/loki-stack > values.loki-stack.orig.yaml
```

```bash
helm upgrade --install loki grafana/loki-stack --namespace monitoring --create-namespace --values values.loki-stack.yaml
```

Add Ingress for Grafana

```bash
kubectl apply --namespace monitoring -f grafana-ingress.yaml
```

## Grafana Setup

### Admin password

Find admin password

```bash
kubectl get secrets grafana -o json | jq '.data | map_values(@base64d)'
```

### Dashboard

Data soruces

| Type        | Name        | URL                                                         |
|-------------|-------------|-------------------------------------------------------------|
| Loki        | Loki        | `http://loki.monitoring:3100`                               |

Dashboards

Log monitoring dashboard (Loki)

| ID    | Title                            |
|-------|----------------------------------|
| 13639 | Logs / App                       |
| 15141 | Loki Kubernetes Logs             |
| 14055 | Loki stack monitoring            |

Select dashboard ID > Load > Data source > Loki > Import

## Clear resources

```bash
kubectl delete -f --namespace monitoring -f grafana-ingress.yaml
kubectl delete namespace monitoring
```
