# RabbitMQ

## Helm chart installation

### Install without storage class

```bash
kubectl create namespace global
```

```bash
helm install rabbitmq oci://registry-1.docker.io/bitnamicharts/rabbitmq --create-namespace --namespace rabbitmq \
  --set plugins="rabbitmq_federation rabbitmq_management rabbitmq_peer_discovery_k8s rabbitmq_management_agent rabbitmq_auth_backend_ldap" \
  --set replicaCount=2
```

Access configuration

```bash
kubectl port-forward --namespace global svc/rabbitmq 5672:5672
kubectl port-forward --namespace global svc/rabbitmq 15672:15672
```

```bash
kubectl get secret --namespace global rabbitmq -o jsonpath="{.data.rabbitmq-password}" | base64 -d
```

### Install with storage class

```bash
helm uninstall rabbitmq -n global
```

Hardware requirements

| Resource | Minimum | Recommend |
|----------|---------|-----------|
| CPU      | 500m    | 1000m     |
| RAM      | 512 MB  | 1 GB      |
| DISK     | 4 GB    | 8 GB      |

```bash
helm upgrade --install rabbitmq oci://registry-1.docker.io/bitnamicharts/rabbitmq --create-namespace --namespace rabbitmq \
  --set persistence.enabled=true \
  --set persistence.storageClass="standard" \
  --set persistence.size=500Mi \
  --set plugins="rabbitmq_federation rabbitmq_management rabbitmq_peer_discovery_k8s rabbitmq_management_agent rabbitmq_auth_backend_ldap" \
  --set replicaCount=3
```

### Install with values file

```bash
kubectl create namespace global
```

```bash
helm install rabbitmq oci://registry-1.docker.io/bitnamicharts/rabbitmq -n rabbit --values values.yaml
```

```bash
helm uninstall rabbitmq -n global
```
