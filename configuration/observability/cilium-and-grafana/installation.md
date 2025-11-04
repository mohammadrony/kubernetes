# Cilium Installation

```bash
cilium install \
  --set hubble.enabled=true \
  --set prometheus.enabled=true \
  --set kubeProxyReplacement=true \
  --set ingressController.enabled=true \
  --set operator.prometheus.enabled=true \
  --set hubble.metrics.enableOpenMetrics=true \
  --set ingressController.service.type=NodePort \
  --set ingressController.loadbalancerMode=shared \
  --set ingressController.service.nodePorts.http=30080 \
  --set ingressController.service.nodePorts.https=30443 \
  --set hubble.metrics.enabled="{dns,drop,tcp,flow,port-distribution,icmp,httpV2:exemplars=true;labelsContext=source_ip\,source_namespace\,source_workload\,destination_ip\,destination_namespace\,destination_workload\,traffic_direction}"
```
