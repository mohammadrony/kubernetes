# Minio Install with Bitnami Chart

```bash
helm show values oci://registry-1.docker.io/bitnamicharts/minio > values.minio-bitnami.yaml
```

Custom configuration

```bash
vi values.minio-bitnami.yaml
```

Update

```yaml
statefulset:
  replicaCount: 1
```

Install helm chart

```bash
helm install minio oci://registry-1.docker.io/bitnamicharts/minio --namespace minio --create-namespace --values values.minio-bitnami.yaml
```

Get login credentials

```bash
export ROOT_USER=$(kubectl get secret --namespace minio minio -o jsonpath="{.data.root-user}" | base64 -d)
export ROOT_PASSWORD=$(kubectl get secret --namespace minio minio -o jsonpath="{.data.root-password}" | base64 -d)
```

```bash
kubectl run --namespace minio minio-client \
  --rm --tty -i --restart='Never' \
  --env MINIO_SERVER_ROOT_USER=$ROOT_USER \
  --env MINIO_SERVER_ROOT_PASSWORD=$ROOT_PASSWORD \
  --env MINIO_SERVER_HOST=minio \
  --image docker.io/bitnami/minio-client:2024.3.30-debian-12-r0 -- admin info minio
```

```bash
kubectl port-forward --namespace minio svc/minio 9001:9001
```
