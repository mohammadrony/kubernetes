# Monitoring

Grafana

```bash
kubectl apply -f https://raw.githubusercontent.com/cilium/cilium/main/examples/kubernetes/addons/prometheus/monitoring-example.yaml
```

Upgrade cilium

```bash
cilium upgrade \
  --set prometheus.enabled=true \
  --set operator.prometheus.enabled=true \
  --set hubble.enabled=true \
  --set hubble.metrics.enableOpenMetrics=true \
  --set hubble.metrics.enabled="{dns,drop,tcp,flow,port-distribution,icmp,httpV2:exemplars=true;labelsContext=source_ip\,source_namespace\,source_workload\,destination_ip\,destination_namespace\,destination_workload\,traffic_direction}"
```

Allow namespaced traffic

```bash
kubectl apply -f ns-l7-visibiilty.yaml
```

Allow clusterwide traffic

```bash
kubectl apply -f clusterwide-l7-visibility.yaml
```

Loki

```bash
helm upgrade --install loki grafana/loki --namespace cilium-monitoring --create-namespace \
  --values values.loki.yaml
```

Promtail

```bash
helm upgrade --install promtail grafana/promtail --namespace monitoring --create-namespace \
  --values values.promtail.yaml
```
