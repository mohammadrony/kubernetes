# Git Repo

## HTTP

Single repository

```bash
kubectl apply -f http-repo-secret.yaml
```

```bash
kubectl get secret <secret-name> -n argocd
```

Multiple repository

```bash
kubectl apply -f http-repos-secret.yaml
```

```bash
kubectl get secret <secret-name> -n argocd
```

## SSH

Single repository

```bash
kubectl apply -f ssh-repo-secret.yaml
```

```bash
kubectl get secret <secret-name> -n argocd
```

Multiple repository

```bash
kubectl apply -f ssh-repos-secret.yaml
```

```bash
kubectl get secret <secret-name> -n argocd
```
