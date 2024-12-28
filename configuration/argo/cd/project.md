# Project

Create project

```bash
kubectl apply -f app-project.yaml
```

Project with role

```bash
kuebctl apply -f app-project-role.yaml
```

```bash
argocd proj role create-token <project-name> <project-role>
```

```bash
argocd app delete <app-name> --auth-token TOKEN_VALUE
# Failed
```

```bash
argocd app sync <app-name> --auth-token TOKEN_VALUE
# Success
```
