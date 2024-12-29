# Installation

## Rollouts

YAML install

```bash
kubectl create namespace argo-rollouts
version=$(curl https://api.github.com/repos/argoproj/argo-rollouts/releases/latest | jq -r .tag_name)
kubectl apply -n argo-rollouts -f https://github.com/argoproj/argo-rollouts/releases/download/$version/install.yaml
```

## Dashboard

```bash
version=$(curl https://api.github.com/repos/argoproj/argo-rollouts/releases/latest | jq -r .tag_name)
kubectl apply -n argo-rollouts -f https://github.com/argoproj/argo-rollouts/releases/download/$version/dashboard-install.yaml
```

Ingress

```bash
kubectl apply -f ingress.yaml
```
