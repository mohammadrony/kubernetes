# Local Storage

## Storage

```bash
kubectl apply -f local-storage-class.yaml
```

Reclaim existing persistent volume

```bash
kubectl patch pv pvname -p '{"spec":{"claimRef": null}}'
```
