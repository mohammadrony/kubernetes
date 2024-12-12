# Install Cert Manager

YAML install

```bash
version=$(curl https://api.github.com/repos/cert-manager/cert-manager/releases/latest | jq -r .tag_name)
curl -LO https://github.com/cert-manager/cert-manager/releases/download/$version/cert-manager.yaml
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
