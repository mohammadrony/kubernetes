# Prometheus and Grafana

## Install Prometheus stack

Add Prometheus repo

```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
```

Install Prometheus

```bash
helm search repo prometheus-community
```

```bash
kubectl create namespace monitoring
```

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
  ingress:
    enabled: true
    ingressClassName: nginx
    hosts:
    - grafana.example.com
```

```bash
helm upgrade --install kube-prometheus-stack prometheus-community/kube-prometheus-stack --namespace monitoring --values values.prometheus-stack.yaml
```

```bash
kubectl get pods -l "release=kube-prometheus-stack" --namespace monitoring
```

Install without grafana

```bash
helm upgrade --install kube-prometheus-stack prometheus-community/kube-prometheus-stack --namespace monitoring --set grafana.enabled=false
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
grafana-cli admin reset-admin-password admin yourPassword
```

### Dashboard Setup

Dashboards > New > New Dashboard > Import dashboard

Metrics monitoring dashboard

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
helm uninstall kube-prometheus-stack --namespace monitoring
```
