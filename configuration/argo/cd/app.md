# Application

- [Argo CD Example Apps](https://github.com/argoproj/argocd-example-apps)

## Create

```bash
argocd app create <app-name> --repo https://github.com/<username>/<repository>.git --path <path> --revision <branch> --dest-server https://kubernetes.default.svc --dest-namespace <namespace> --sync-policy automated --sync-option CreateNamespace=true
```

App of apps

```bash
argocd app create app-of-apps -f app-of-apps.yaml
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
