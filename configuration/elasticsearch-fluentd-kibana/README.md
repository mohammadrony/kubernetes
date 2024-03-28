# Elasticsearch Fluentd and Kibana

## Helm Chart

Initial setup

```bash
helm repo add stable https://charts.helm.sh/stable
helm repo update
```

```bash
kubectl create namespace logging
```

### Install Elasticsearch

```bash
helm show values stable/elasticsearch > values.elasticsearch.yaml
```

Custom configuration

```bash
vi values.elasticsearch.yaml
```

Update

```yaml
data:
  persistence:
    size: "10Gi"
```

```bash
helm upgrade --install elasticsearch stable/elasticsearch --namespace logging --values values.elasticsearch.yaml
```

```bash
kubectl edit svc kibana --namespace logging
```

Update kibana service

```yaml
spec:
  ports:
    nodePort: 30011
  type: NodePort
```

Get log indices

```bash
curl http://172.29.58.32:30011/_cat/indices?v
```

Delete logs

```bash
curl -X DELETE "localhost:9200/_all"
```

```bash
curl -X DELETE "http://172.29.58.32:30011/logstash-XXXX.*.*"
```

### Install Kibana

```bash
helm show values stable/kibana > values.kibana.yaml
```

Custom configuration

```bash
vi values.kibana.yaml
```

Update

```yaml
files:
  kibana.yaml:
    elasticsearch.hosts: http://elasticsearch-client:9200

ingress:
  enabled: true
  hosts:
  - kibana.example.com
  annotations:
    kubernetes.io/ingress.class: nginx
```

```bash
helm upgrade --install kibana stable/kibana --namespace logging --values values.kibana.yaml
```

Update kibana service

```yaml
spec:
  ports:
    nodePort: 30010
  type: NodePort
```

### Install Fluentd

```bash
helm show values stable/fluentd-elasticsearch > values.fluentd.yaml
helm upgrade --install fluentd stable/fluentd-elasticsearch --namespace logging
```

## Uninstall Charts

```bash
helm uninstall elasticsearch --namespace logging
```

```bash
helm uninstall kibana --namespace logging
```

```bash
helm uninstall fluentd --namespace logging
```
