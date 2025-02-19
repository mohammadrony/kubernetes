# Matrics Server

Install metrics server

```bash
helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server/
helm repo update
```

```bash
helm show values metrics-server/metrics-server > values.metrics-server.yaml
# helm upgrade --install metrics-server metrics-server/metrics-server -n kube-system
helm upgrade --install --set args={--kubelet-insecure-tls} metrics-server metrics-server/metrics-server -n kube-system
```

Uninstall metrics server

```bash
helm uninstall metrics-server -n kube-system
```

Monitor metrics

```bash
kubectl top nodes
```

```bash
kubectl top pods
```
