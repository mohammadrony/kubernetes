# Minio Kubectl Plugin

```bash
kubectl krew install minio
```

## Operator

### Initialize Operator

Dry run

```bash
kubectl minio init --output
```

Create resource

```bash
kubectl minio init
```

## Tenant

Create persistent volume

```bash
kubectl apply -f persistent-volume.yaml
```

Start minio tenant

```bash
kubectl minio tenant create miniotenant \
  --capacity 4Gi                        \
  --servers 2                           \
  --volumes 4                           \
  --namespace minio                     \
  --storage-class local-storage
  # --output > minio-tenant.yaml
```

Minio api ingress

```bash
kubectl apply -f minio-ingress.yaml
```
