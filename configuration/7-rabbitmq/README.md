# RabbitMQ

## Helm chart installation

Install with parameter value

```bash
kubectl create namespace rabbits
```

```bash
helm install rabbitmq oci://registry-1.docker.io/bitnamicharts/rabbitmq -n rabbits \
  --set persistence.enabled=true \
  --set persistence.storageClass="standard" \
  --set persistence.size=100Mi
  --set replicaCount=2
```

```bash
helm uninstall rabbitmq -n rabbits
```

Install with values file

```bash
kubectl create namespace rabbits
```

```bash
helm install rabbitmq oci://registry-1.docker.io/bitnamicharts/rabbitmq -n rabbit --values values.yaml
```

```bash
helm uninstall rabbitmq -n rabbits
```
