# Application

Create

```bash
argocd app create <app-name> --repo https://github.com/<username>/<repository>.git --path <path> --dest-server https://kubernetes.default.svc --dest-namespace <namespace> --sync-policy automated
```

Sync

```bash
argocd app sync <app-name>
```
