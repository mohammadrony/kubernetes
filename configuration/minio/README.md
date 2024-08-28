# Minio

## Helm Install

### Operator

[Project](https://github.com/minio/operator)

```bash
kubectl create namespace minio-tenant-1
```

```bash
helm repo add minio-operator https://operator.min.io
helm repo update
```

```bash
helm show values minio-operator/operator > values.minio-operator.yaml
```

```bash
helm install \
  --namespace minio-operator \
  --create-namespace \
  operator minio-operator/operator \
  --values values.minio-operator.yaml
```

Create token

```bash
kubectl apply -f secret.operator-console.yaml
```

Get token

```bash
kubectl -n minio-operator get secret console-sa-secret -o jsonpath="{.data.token}" | base64 --decode
```

Update NodePort

```bash
kubectl edit svc console
```

```yaml
spec:
  ports:
  - name: http
    nodePort: 30000
  type: NodePort
```

### Tenant

```bash
kubectl minio tenant create miniotenant \
  --capacity 32Gi      \
  --servers 2          \
  --volumes 4          \
  --namespace minio    \
  --storage-class local-storage
```

### Post Installation

```bash
kubectl get secret/console-sa-secret -n minio -o json | jq -r ".data.token" | base64 -d
```
