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

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
spec:
  source:
    directory:
      recurse: true
```

Automatic sync

```bash
argocd app create <app-name> ... --sync-policy automated
```

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
spec:
  syncPolicy:
    automated: {}
```

Create namespace

```bash
argocd app create <app-name> ... --sync-option CreateNamespace=true
```

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
spec:
  syncPolicy:
    syncOptions:
      - CreateNamespace=true
```

Automatic prune

```bash
argocd app create <app-name> ... --sync-policy automated --auto-prune
```

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
spec:
  syncPolicy:
    automated:
      prune: true
```

Self healing

```bash
argocd app create <app-name> ... --sync-policy automated --self-heal
```

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
spec:
  syncPolicy:
    automated:
      selfHeal: true
```

Prevent pruning resource

```yaml
apiVersion: ...
kind: ...
metadata:
  annotations:
    argocd.argoproj.io/sync-options: Prune=false
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
