#

helm upgrade --install promtail grafana/promtail -n observability -f promtail.yaml
helm upgrade --install loki grafana/loki-distributed -n observability loki.yaml
helm upgrade --install tempo grafana/tempo-distributed -n observability -f tempo.yaml
helm upgrade --install kube-prometheus-stack prometheus-community/kube-prometheus-stack -n observability .

##

helm install loki grafana/loki-stack --namespace observability --values values.loki-stack-custom.yaml
helm install tempo grafana/tempo --values 2-tempo-helm-values.yaml
helm install kube-prometheus-stack prometheus-community/kube-prometheus-stack --values 03-grafana-helm-values.yaml
kubectl port-forward svc/loki-grafana 8080:80
helm install  --set admissionWebhooks.certManager.enabled=false --set admissionWebhooks.autoGenerateCert.enabled=true --namespace opentelemetry-operator-system --create-namespace opentelemetry-operator open-telemetry/opentelemetry-operator
kubectl apply -f 4-collector-ds.yaml
kubectl apply -f 5-instrumentation.yaml
kubectl apply -f 6-weather-app.yaml
