# Minio

```bash
kubectl krew install minio
```

## Operator

Dry run

```bash
kubectl minio init --output
```

Create resource

```bash
kubectl minio init
```

## Tenant

Start minio tenant

```bash
kubectl minio tenant create miniotenant \
  --capacity 4Gi                        \
  --servers 2                           \
  --volumes 4                           \
  --namespace minio                     \
  --storage-class local-storage
  --output > minio-tenant.yaml
```
