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

Possible server volume combination

| Server count  | Volume count  | Volumes per server  |
|---------------|---------------|---------------------|
| 1             | 1, 2, 3       | 1, 2, 3             |
| 2             | 4, 6, 8       | 2, 3, 4             |
| 3             | 6, 9, 12      | 2, 3, 4             |
| 4             | 4, 8, 12      | 1, 2, 3             |

### Kubectl Plugin Installation

```bash
kubectl minio tenant create minio-tenant  \
  --servers          1                    \
  --volumes          2                    \
  --capacity         8Gi                  \
  --namespace        minio                \
  --storage-class    local-storage        \
  --output > minio-tenant.yaml
```

```bash
sed -i '/creationTimestamp/d' minio-tenant.yaml
```

```bash
kubectl apply -f minio-tenant.yaml
```

Ingress config

```bash
kubectl apply -f minio-ingress.yaml
```

### Helm Chart Installation

```bash
helm show values minio/tenant > values.tenant.yaml 
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
  minio-tenant minio/tenant
```

## Nginx Config

- [Configure NGINX Proxy for MinIO Server](https://min.io/docs/minio/linux/integrations/setup-nginx-proxy-with-minio.html)
- [Nginx HTTP Core Module](http://nginx.org/en/docs/http/ngx_http_core_module.html#client_max_body_size)
- [Custom max body size](https://kubernetes.github.io/ingress-nginx/user-guide/nginx-configuration/annotations/#custom-max-body-size)
