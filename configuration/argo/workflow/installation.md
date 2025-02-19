# Installation

```bash
kubectl create namespace argo
```

YAML install

```bash
version=$(curl https://api.github.com/repos/argoproj/argo-workflows/releases/latest | jq -r .tag_name)
kubectl apply -n argo https://github.com/argoproj/argo-workflows/releases/download/$version/install.yaml
```

```bash
kubectl get pods -n argo
```

## RBAC

Cluster role

```bash
kubectl apply -f rbac.yaml
```
