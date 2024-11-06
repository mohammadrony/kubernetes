# Install Cert Manager

[Release](https://github.com/cert-manager/cert-manager/releases)

```bash
version=1.16.1
curl -LO https://github.com/cert-manager/cert-manager/releases/download/v$version/cert-manager.yaml
kubectl apply -f cert-manager.yaml
```

Helm chart

```bash
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm upgrade --install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --set crds.enabled=true
```

## Usage

Certificates

```bash
kubectl get certificate -A
```
