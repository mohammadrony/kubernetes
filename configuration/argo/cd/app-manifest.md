# Application Manifest

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

Selective sync

```bash
argocd app create <app-name> ... --sync-option ApplyOutOfSyncOnly=true
```

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
spec:
  syncPolicy:
    automated: {}
    syncOptions:
      - ApplyOutOfSyncOnly=true
```

Disable sync in shared resource

```bash
argocd app create <app-name> ... --sync-option FailOnSharedResource=true
```

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
spec:
  syncPolicy:
    automated: {}
    syncOptions:
      - FailOnSharedResource=true
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

Replace resource

```bash
argocd app create <app-name> ... --sync-option Replace=true
```

```yaml
apiVersion: ...
kind: ...
metadata:
  annotations:
    argocd.argoproj.io/sync-options: Replace=true
```

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
spec:
  syncPolicy:
    automated: {}
    syncOptions:
      - Replace=true
```
