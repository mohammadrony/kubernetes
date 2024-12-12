# Minio Operator

## Chart Installation

### Configuration

Setup repository from [Github](https://github.com/minio/operator)

```bash
helm repo add minio https://operator.min.io/
helm repo update
```

```bash
version=$(curl https://api.github.com/repos/minio/operator/releases/latest | jq -r .tag_name)
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

  resources:
    requests:
      memory: 512Mi
      cpu: 500m
    limits:
      memory: 1Gi
      cpu: 1000m
```

### Installation

```bash
helm install minio-operator operator --namespace minio-operator --create-namespace --values operator/values.yaml
```

```bash
kubectl apply -f secret.operator-console.yaml
```

```bash
kubectl -n minio-operator  get secret console-sa-secret -o jsonpath="{.data.token}" | base64 --decode && echo
```
