# Service Monitoring (Metrics, Log and Trace) with Opentelemetry and Grafana Stack

Observability in microservice is one of the requirement to understand the application status in a platform. Understanding the metrics, logs and tracing calls can help identify the root cause of any incident. Following components can be used to configure observability in kubernetes.

## Components

- Kubernetes Cluster
- Opentelemetry
  - Operator
  - Collector
  - Instrumentation
- Grafana Stack
  - Loki
  - Tempo
  - Grafana
- Prometheus
  - Operator
  - Node Exporter

## Configuration

- Opentelemetry collector
  - collect logs and send them to loki.
  - collect trace data and send them to tempo.
- Prometheus
  - collect metrics from node.
- Grafana
  - visualize data from prometheus, loki and tempo.

## Opentelemetry

### Operator

`helm upgrade --install opentelemetry-operator open-telemetry/opentelemetry-operator --namespace opentelemetry --create-namespace -f values.otel-operator.yaml`

### Collector

`helm upgrade --install opentelemetry-collector open-telemetry/opentelemetry-collector --namespace opentelemetry --create-namespace -f values.otel-collector.yaml`

### Instrumentation

`kubectl apply -f otel-instrumentation.yaml`

### Nodejs Instrumentation

Package

```bash
npm install @opentelemetry/api
npm install @opentelemetry/auto-instrumentations-node
```

Annotation

```yaml
apiVersion: apps/v1
kind: Deployment
spec:
  template:
    metadata:
      annotations:
        instrumentation.opentelemetry.io/inject-nodejs: opentelemetry/nodejs-instrumentation
```

### Java Instrumentation

```yaml
apiVersion: apps/v1
kind: Deployment
spec:
  template:
    metadata:
      annotations:
        instrumentation.opentelemetry.io/inject-java: opentelemetry/java-instrumentation
```

### Python Instrumentation

Package

```bash
pip install opentelemetry-distro opentelemetry-exporter-otlp
opentelemetry-bootstrap -a install
```

Annotation

```yaml
apiVersion: apps/v1
kind: Deployment
spec:
  template:
    metadata:
      annotations:
        instrumentation.opentelemetry.io/inject-python: opentelemetry/python-instrumentation
```

## Prometheus

`helm upgrade --install kube-prometheus-stack prometheus-community/kube-prometheus-stack --namespace monitoring --create-namespace -f values.prometheus.yaml`

## Grafana

Tempo

`helm install tempo grafana/tempo --namespace monitoring --create-namespace -f values.tempo.yaml`

Loki

`kubectl apply -f loki-pv.yaml`

`helm install loki grafana/loki --namespace monitoring --create-namespace -f values.loki.yaml`

Grafana

`helm install grafana grafana/grafana --namespace monitoring --create-namespace -f values.grafana.yaml`

`kubectl apply -f grafana-ingress.yaml`
