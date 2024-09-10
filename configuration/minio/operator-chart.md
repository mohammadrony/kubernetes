# Minio Operator Chart

## Prepare Nodes for Label selector

```bash
kubectl get nodes --show-labels
kubectl label nodes NODE-NAME storage-type=persistent
```

## Configuration

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

```bash
vi operator/values.yaml
```

```yaml
console:
  ingress:
    enabled: true
    ingressClassName: nginx
    hosts:
      - minio.example.com

operator:
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

## Installation

```bash
helm install minio-operator operator --namespace minio-operator --create-namespace --values operator/values.yaml
```

```bash
kubectl apply -f secret.operator-console.yaml
```

```bash
kubectl -n minio-operator  get secret console-sa-secret -o jsonpath="{.data.token}" | base64 --decode
```
