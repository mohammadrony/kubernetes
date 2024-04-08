# Grafana with Tempo Loki Prometheus

## Installation

[Harnessing the Power of Observability in Kubernetes with OpenTelemetry](https://www.linkedin.com/pulse/harnessing-power-observability-kubernetes-opentelemetry-g5ahc/)

```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
```

```bash
kubectl create namespace observability
kubectl config set-context --current --namespace observability
```

```bash
wget https://raw.githubusercontent.com/brainupgrade-in/kubernetes/main/observability/opentelemetry/01-loki-helm-values.yaml
wget https://raw.githubusercontent.com/brainupgrade-in/kubernetes/main/observability/opentelemetry/02-tempo-helm-values.yaml
https://raw.githubusercontent.com/brainupgrade-in/kubernetes/main/observability/opentelemetry/03-grafana-helm-values.yaml
```

```bash
helm upgrade --install loki grafana/loki --values 01-loki-helm-values.yaml
helm upgrade --install tempo grafana/tempo --values 02-tempo-helm-values.yaml
helm upgrade --install kube-prometheus-stack prometheus-community/kube-prometheus-stack --values 03-grafana-helm-values.yaml
```

```bash
helm install opentelemetry-operator open-telemetry/opentelemetry-operator
```

```bash
helm install promtail grafana/promtail --set "loki.serviceName=loki.observability.svc.cluster.local"
```

```bash
helm dependency build
```

```bash
helm depencencies update
```
