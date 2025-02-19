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

## Install Prometheus stack

Prerequisites

```bash
# for all node
sudo systemctl stop node_exporter
sudo systemctl disable node_exporter
```

Add Prometheus repo

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
```

Install Prometheus

```bash
helm show values prometheus-community/kube-prometheus-stack > values.prometheus-stack.yaml
```

Custom configuration

```bash
vi values.prometheus-stack.yaml
```

Update

```yaml
grafana:
  enabled: false
```

```bash
helm upgrade --install kube-prometheus-stack prometheus-community/kube-prometheus-stack --namespace monitoring --create-namespace --values values.prometheus-stack.yaml
```

## Expose Grafana service NodePort

### Expose grafana service

```bash
kubectl edit svc kube-prometheus-stack-grafana --namespace monitoring
```

Update default service

```yaml
spec:
  ports:
    nodePort: 30001
  type: NodePort
```

Create expose service

```bash
kubectl expose svc/kube-prometheus-stack-grafana --namespace monitoring --target-port=3000 --type=NodePort --name=grafana-nodeport
```

Service port forwarding

```bash
kubectl port-forward svc/kube-prometheus-stack-grafana 8080:80
```

### Admin password setup

Find admin password

```bash
kubectl get secrets kube-prometheus-stack-grafana -o json | jq '.data | map_values(@base64d)'
```

Reset password

```bash
kubectl exec -it $(kubectl get pods -l "app=grafana,release=grafana" -o jsonpath="{.items[0].metadata.name}") grafana-cli admin reset-admin-password yourPassword
```

```bash
kubectl exec -it kube-prometheus-stack-grafana-XXXX-XX -- /bin/bash
grafana-cli admin reset-admin-password yourPassword
```

### Dashboard Setup

Data soruces

| Type        | Name        | URL                                                         |
|-------------|-------------|-------------------------------------------------------------|
| Prometheus  | Prometheus  | `http://kube-prometheus-stack-prometheus.monitoring:9090`   |
| Loki        | Loki        | `http://loki.monitoring:3100`                               |

Dashboards

Metrics monitoring dashboard (Prometheus)

| ID    | Title                            |
|-------|----------------------------------|
| 1860  | Node Exporter Full               |
| 15757 | Kubernetes / Views / Global      |
| 15758 | Kubernetes / Views / Namespaces  |
| 15759 | Kubernetes / Views / Nodes       |
| 15760 | Kubernetes / Views / Pods        |

Select dashboard ID > Load > Data source > Prometheus > Import

Log monitoring dashboard (Loki)

| ID    | Title                            |
|-------|----------------------------------|
| 13639 | Logs / App                       |
| 15141 | Loki Kubernetes Logs             |
| 14055 | Loki stack monitoring            |

Select dashboard ID > Load > Data source > Loki > Import

## Clear resources

```bash
helm uninstall kube-prometheus-stack --namespace monitoring
helm uninstall loki --namespace monitoring
```

```bash
kubectl delete -f --namespace monitoring -f grafana-ingress.yaml
kubectl delete namespace monitoring
```
