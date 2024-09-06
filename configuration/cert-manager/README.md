# Cert Manager

## Installation

[Release](https://github.com/cert-manager/cert-manager/releases)

```bash
version=1.15.3
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v$version/cert-manager.yaml
```

Helm chart

```bash
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm upgrade --install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --set crds.enabled=true
```
