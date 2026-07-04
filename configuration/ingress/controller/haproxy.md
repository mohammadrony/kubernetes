# Haproxy Ingress Controller

## Helm chart

```bash
helm repo add haproxytech https://haproxytech.github.io/helm-charts
helm repo update
```

```bash
helm install haproxy-ingress haproxytech/kubernetes-ingress --namespace haproxy-controller --create-namespace
```

Custom configuration

```bash
helm show values haproxytech/kubernetes-ingress > values.haproxy.yaml
```

```bash
helm upgrade --install haproxy-ingress haproxytech/kubernetes-ingress --values values.haproxy.yaml --namespace haproxy-controller --create-namespace
```

## Verify

```bash
kubectl get pods -n haproxy-controller
kubectl get services -o wide -n haproxy-controller
```
