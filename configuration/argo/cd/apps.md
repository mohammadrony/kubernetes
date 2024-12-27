# Application

- [Argo CD Example Apps](https://github.com/argoproj/argocd-example-apps)

## Create

```bash
argocd app create <app-name> --repo https://github.com/<username>/<repository>.git --path <path> --revision <branch> --dest-server https://kubernetes.default.svc --dest-namespace <namespace> --sync-policy automated --sync-option CreateNamespace=true
```

Recurse directory

```bash
argocd app create <app-name> ... --directory-recurse
```

Automatic sync

```bash
argocd app create <app-name> ... --sync-policy automated
```

Create namespace

```bash
argocd app create <app-name> ... --sync-option CreateNamespace=true
```

Apply manifest

```bash
kubectl apply -f application.yaml
```

```bash
kubectl apply -f helm-application.yaml
```

```bash
kubectl apply -f kustomize-application.yaml
```

## Sync

```bash
argocd app sync <app-name>
```

Delete unexpected resource

```bash
argocd app sync <app-name> --prune
```

## List

```bash
argocd app list
```
