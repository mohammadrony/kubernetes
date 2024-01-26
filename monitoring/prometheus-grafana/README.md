# Prometheus and Grafana Installation

## Helm setup

Install Helm

```bash
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
```

Or

```bash
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt install -y apt-transport-https
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt update -y
sudo apt install -y helm
```

Add Helm repo

```bash
helm repo add stable https://charts.helm.sh/stable
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
helm install kube-prometheus-stack prometheus-community/kube-prometheus-stack
```

## Setup Grafana

Expose grafana service

```bash
kubectl expose svc/kube-prometheus-stack-grafana --target-port=3000 --type=NodePort --name=grafana-ui
```

For kind cluster

```bash
kubectl port-forward svc/grafana-ui 30000:80
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
