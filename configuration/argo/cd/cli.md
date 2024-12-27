# CLI

## Installation

```bash
version=$(curl https://api.github.com/repos/argoproj/argo-cd/releases/latest | jq -r .tag_name)
sudo curl -L -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/download/$version/argocd-linux-amd64
sudo chmod +x /usr/local/bin/argocd
```

## Commands

### Login

Admin password

```bash
kubectl get secret -n argocd argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
```

```bash
argocd login <host> --username admin --password <password> --grpc-web # --insecure
```

### Context

Context list

```bash
argocd context
```

Switch context

```bash
argocd context cd.example.com
```

Delete context

```bash
argocd context cd.example.com --delete
```

### Cluster

Cluster list

```bash
argocd cluster list
```
