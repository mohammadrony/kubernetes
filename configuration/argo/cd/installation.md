# Installation

## Helm chart

Repository

```bash
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
```

Argo CD

```bash
# helm pull argo/argo-cd --untar
helm install argocd argo/argo-cd --namespace argocd --create-namespace
```

## YAML install

```bash
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

## Dashboard

Ingress

```bash
kubectl apply -f ingress.yaml
```

Admin password

```bash
kubectl get secret -n argocd argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
```
