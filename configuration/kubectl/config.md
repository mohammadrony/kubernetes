# Config Commands

Get cluster list

```bash
kubectl config get-clusters
```

Set current context

```bash
kubectl config use-context CONTEXT
```

Rename context

```bash
kubectl config rename-context CONTEXT NEW_CONTEXT
```

Get full config

```bash
kubectl config view --flatten
kubectl config view --raw
```

Get current context config

```bash
kubectl config view --flatten --minify
```
