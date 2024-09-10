# Minio Tenant

## Create Tenant

- Open Minio Operator
- Select Create Tenant
- Setup
  - Name: `minio-tenant`
  - Namespace: `namespace`
  - Storage Class: `local-storage`
  - Number of Servers: 2
  - Drives per Server: 2
  - Total Size: 100
  - Erasure Code Parity: `EC:2`. [[concept](https://min.io/docs/minio/kubernetes/upstream/operations/concepts/erasure-coding.html)]
  - CPU Request: 1
  - Memory Request: 2
  - CPU Limit: 2
  - Memory Limit: 2

## Kubectl minio command

```bash
kubectl minio tenant create minio-tenant  \
  --servers          2                    \
  --volumes          4                    \
  --capacity         4Gi                  \
  --namespace        minio                \
  --storage-class    local-storage        \
  --output > minio-tenant.yaml
```

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

## File Upload Limit

- [Configure NGINX Proxy for MinIO Server](https://min.io/docs/minio/linux/integrations/setup-nginx-proxy-with-minio.html)
- [Nginx HTTP Core Module](http://nginx.org/en/docs/http/ngx_http_core_module.html#client_max_body_size)
- [Custom max body size](https://kubernetes.github.io/ingress-nginx/user-guide/nginx-configuration/annotations/#custom-max-body-size)
