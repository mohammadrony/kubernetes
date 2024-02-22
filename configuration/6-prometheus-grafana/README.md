# Prometheus and Grafana

## Setup Matrics server

Install metrics server

```bash
helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server/
helm repo update
```

```bash
helm install metrics-server metrics-server/metrics-server -n kube-system

# For kind cluster
# helm install --set args={--kubelet-insecure-tls} metrics-server metrics-server/metrics-server -n kube-system
```

Uninstall metrics server

```bash
helm uninstall metrics-server 
```

## Install Prometheus stack

Add Prometheus repo

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
```

Install Prometheus

```bash
helm search repo prometheus-community
```

```bash
kubectl create namespace prometheus
```

```bash
helm install kube-prometheus-stack prometheus-community/kube-prometheus-stack -n prometheus
```

```bash
kubectl -n prometheus get pods -l "release=kube-prometheus-stack"
```

## Setup Grafana

Expose grafana service

```bash
kubectl expose svc/kube-prometheus-stack-grafana -n prometheus --target-port=3000 --type=NodePort --name=grafana-nodeport
```

For kind cluster

```bash
kubectl port-forward svc/kube-prometheus-stack-grafana 30000:80
kubectl port-forward svc/kube-prometheus-stack-prometheus 30001:9090
```

### Grafana admin password

Find default password

```bash
kubectl get secret kube-prometheus-stack-grafana -o jsonpath="{.data.admin-password}" | base64 -d ; echo
```

Reset password

```bash
kubectl exec -it $(kubectl get pods -l "app=grafana,release=grafana" -o jsonpath="{.items[0].metadata.name}") grafana-cli admin reset-admin-password yourPassword
```

```bash
kubectl exec -it kube-prometheus-stack-grafana-XXXX-XX -- /bin/bash
grafana-cli admin reset-admin-password admin yourPassword
```

### Dashboard Setup

Dashboards > New > New Dashboard > Import dashboard

Some popular dashboards

| ID    | Title                            |
|-------|----------------------------------|
| 1860  | Node Exporter Full               |
| 15757 | Kubernetes / Views / Global      |
| 15758 | Kubernetes / Views / Namespaces  |
| 15759 | Kubernetes / Views / Nodes       |
| 15760 | Kubernetes / Views / Pods        |

Select dashboard ID > Load > Data source > Prometheus > Import

## Clear resources

```bash
helm uninstall kube-prometheus-stack
```
