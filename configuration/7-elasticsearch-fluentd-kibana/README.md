# Elasticsearch Fluentd and Kibana

## Helm Chart

```bash
kubectl create namespace efk
```

```bash
helm install elasticsearch elastic/elasticsearch -n efk
```

```bash
kubectl get secrets --namespace=efk elasticsearch-master-credentials -ojsonpath='{.data.password}' | base64 -d
```
