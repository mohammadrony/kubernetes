# RabbitMQ

## Helm chart installation

Default Installation

```bash
kubectl create namespace rabbit
```

```bash
helm install rabbits oci://registry-1.docker.io/bitnamicharts/rabbitmq
```

```bash
helm uninstall rabbits
```

Install with custom values

```bash
kubectl create namespace rabbit
```

```bash
helm install rabbits oci://registry-1.docker.io/bitnamicharts/rabbitmq -n rabbit --values values.yaml
```

```bash
helm uninstall rabbits -n rabbit
```
