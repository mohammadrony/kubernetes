# Open Telemetry Operator

## Install

```bash
helm repo add open-telemetry https://open-telemetry.github.io/opentelemetry-helm-charts
helm repo update
```

```bash
$ helm install  --set admissionWebhooks.certManager.enabled=false --set admissionWebhooks.autoGenerateCert.enabled=true \
  opentelemetry-operator open-telemetry/opentelemetry-operator
```

Collector

```bash
kubectl apply -f collector-sts.yaml
```

## Uninstall

```bash
helm uninstall opentelemetry-operator
```

```bash
kubectl delete crd opentelemetrycollectors.opentelemetry.io
kubectl delete crd opampbridges.opentelemetry.io
kubectl delete crd instrumentations.opentelemetry.io
```
