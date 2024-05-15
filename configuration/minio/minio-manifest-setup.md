# Source Release

## Prepare Nodes for Label selector

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
  size: 1Gi

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
