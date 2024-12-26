# CLI

## Installation

```bash
version=$(curl https://api.github.com/repos/argoproj/argo-cd/releases/latest | jq -r .tag_name)
curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/download/$version/argocd-linux-amd64
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
rm argocd-linux-amd64
```

## Commands

### Login

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

### Application

```bash
argocd app ls
```
