# Minio Tenant Chart

## Helm Chart installation

```bash
helm show values minio-operator/tenant > values.tenant.yaml 
```

Custom values

```yaml
tenant:
  name: myminio
  pools:
    - servers: 2
      name: pool-0
      volumesPerServer: 2
      size: 1Gi
      storageClassName: local-storage
```

```bash
helm install \
  --namespace minio \
  --create-namespace \
  minio-tenant minio-operator/tenant
```
