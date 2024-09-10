# Minio Kubectl Plugin

```bash
kubectl krew install minio
```

## Operator

## Tenant

```bash
kubectl minio tenant create miniotenant \
  --capacity 4Gi       \
  --servers 2          \
  --volumes 4          \
  --namespace minio    \
  --storage-class local-storage
```
