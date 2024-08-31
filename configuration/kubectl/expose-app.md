# Expose Application

## Service

Expose deployment service

```bash
kubectl expose DEPLOYMENT SERVICE --port CONTAINER_PORT
```

Expose nodeport service

```bash
kubectl expose svc/SERVICE --type=NodePort --port SERVICE_PORT --target-port=CONTAINER_PORT --name=SERVICE_NAME
```

## Proxy service

```bash
kubectl proxy --port=8001
```

Visit following URL for `SERVICE.NAMESPACE:PORT` service and `http` or `https` protocol.

<http://localhost:8001/api/v1/namespaces/NAMESPACE/services/HTTP:SERVICE:PORT/proxy/>

## Ingress

## Port forwarding

```bash
kubectl port-forward pod/POD HOST_PORT:POD_PORT
```

```bash
kubectl port-forward service/SERVICE HOST_PORT:SERVICE_PORT
```

```bash
kubectl port-forward deployment/DEPLOYMENT HOST_PORT:DEPLOYMENT_PORT
```

```bash
kubectl port-forward service/SERVICE HOST_PORT:SERVICE_PORT --address 0.0.0.0
kubectl port-forward service/SERVICE HOST_PORT:SERVICE_PORT --address localhost,10.10.20.20
```
