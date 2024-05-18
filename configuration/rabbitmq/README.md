# RabbitMQ

## Helm chart installation

### Install without storage class

```bash
NS=rabbits
```

```bash
helm upgrade --install rabbitmq oci://registry-1.docker.io/bitnamicharts/rabbitmq --create-namespace --namespace $NS \
  --set plugins="rabbitmq_federation rabbitmq_management rabbitmq_peer_discovery_k8s rabbitmq_management_agent rabbitmq_auth_backend_ldap" \
  --set replicaCount=2
```

Access configuration

```bash
kubectl port-forward --namespace $NS svc/rabbitmq 5672:5672
kubectl port-forward --namespace $NS svc/rabbitmq 15672:15672
```

```bash
kubectl get secret --namespace $NS rabbitmq -o jsonpath="{.data.rabbitmq-password}" | base64 -d
```

### Install with storage class

```bash
helm uninstall rabbitmq -n $NS
```

Hardware requirements

| Resource | Minimum | Recommend |
|----------|---------|-----------|
| CPU      | 500m    | 1000m     |
| RAM      | 512 MB  | 1 GB      |
| DISK     | 4 GB    | 8 GB      |

```bash
helm upgrade --install rabbitmq oci://registry-1.docker.io/bitnamicharts/rabbitmq \
  --set persistence.enabled=true \
  --set persistence.storageClass="longhorn" \
  --set persistence.size=500Mi \
  --set plugins="rabbitmq_federation rabbitmq_management rabbitmq_peer_discovery_k8s rabbitmq_management_agent rabbitmq_auth_backend_ldap" \
  --set replicaCount=2 \
  --create-namespace --namespace $NS
```

## Expose with Nginx

```bash
sudo dnf install -y nginx-mod-stream
```

```bash
vi /etc/nginx/nginx.conf
```

```conf
stream {
    upstream rabbitmq {
      server <LoadBalancer IP>:5672;
    }

    server {
        listen 5672;
        proxy_pass rabbitmq;
        proxy_timeout 1h;
        proxy_connect_timeout 1h;
    }
}
```

```bash
sudo systemctl reload nginx
```

### Install with values file

```bash
kubectl create namespace $NS
```

```bash
NS=test
helm upgrade --install rabbitmq oci://registry-1.docker.io/bitnamicharts/rabbitmq -n $NS --values values.yaml
```

```bash
helm uninstall rabbitmq -n $NS
```
