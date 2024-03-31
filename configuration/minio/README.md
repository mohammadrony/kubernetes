# Minio

## Helm Chart

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

## Source Release

### Prepare Nodes for Label selector

```bash
kubectl get nodes --show-labels
kubectl label nodes NODE-NAME storage-type=persistent
```

Setup repository from [Github](https://github.com/minio/operator)

```bash
helm repo add minio-operator
helm repo update
```

```bash
version=5.0.9
wget https://raw.githubusercontent.com/minio/operator/master/helm-releases/operator-$version.tgz -O operator.tgz
wget https://raw.githubusercontent.com/minio/operator/master/helm-releases/tenant-$version.tgz -O tenant.tgz
```

Extract archive

```bash
gunzip operator.tgz
tar -xvf operator.tar
```

Update values

```yaml
persistence:
  storageClass: "longhorn"
  size: 50Gi

ingress:
  enabled: true
  ingressClassName: nginx
  hosts:
    - minio.example.com

# nodeSelector:
#   storage-type: persistent

affinity:
  nodeAffinity:
    preferredDuringSchedulingIgnoredDuringExecution:
      - weight: 100
        preference:
          matchExpressions:
            - key: storage-type
              operator: In
              values:
                - persistent

resources:
  requests:
    memory: 512Mi
    cpu: 500m
  limits:
    memory: 1Gi
    cpu: 1000m
```

```bash
helm install minio-operator operator --namespace minio --create-namespace --values minio/values.operator.yaml
```

### Post Installation

```bash
kubectl get secret/console-sa-secret -n minio -o json | jq -r ".data.token" | base64 -d
```
