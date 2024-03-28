# Minio

## Helm Installation

Add Helm repo

```bash
helm repo add minio https://charts.min.io/
helm repo update
```

```bash
helm show values minio/minio values.minio.yaml
```

Custom configuration

```bash
vi values.minio.yaml
```

Update

```yaml
additionalLabels:
  app: minio

existingSecret: "minio-secret"

replicas: 2

persistence:
  storageClass: "longhorn"
  size: 30Gi

ingress:
  enabled: true
  ingressClassName: nginx
  hosts:
    - minio.example.com
```

Create secret

```bash
kubectl create secret generic minio-secret --from-literal=rootUser=Admin --from-literal=rootPassword=7XxV00jMQ8A9Xi5
```

```bash
helm install minio/minio --namespace minio --create-namespace --values values.minio.yaml
```
