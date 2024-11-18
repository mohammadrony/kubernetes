# Quick Reference

[kubectl Quick Reference](https://kubernetes.io/docs/reference/kubectl/quick-reference/)

Json path

```bash
kubectl get nodes -o json | jq -c 'paths|join(".")'
```

Events

```bash
kubectl get events -A --sort-by='{.metadata.creationTimestamp}'
```

Pod

```bash
kubectl top pods --containers
```

```bash
kubectl top pods --sort-by=cpu
```
