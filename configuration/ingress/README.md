# Ingress Controller

## Ingress Nginx

### Nginx Helm chart

```bash
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
```

```bash
helm install ingress-nginx ingress-nginx/ingress-nginx --namespace ingress-nginx --create-namespace
```

Custom configuration

```bash
helm show values ingress-nginx/ingress-nginx > values.ingress-nginx.yaml
```

```bash
helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx --values values.ingress-nginx.yaml --namespace ingress-nginx --create-namespace
```

### Manifest for baremetal cluster

```bash
curl -O https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.9.6/deploy/static/provider/baremetal/deploy.yaml
kubectl apply -f deploy.yaml
```

```bash
kubectl get services -o wide --all-namespaces | grep -E 'LoadBalancer|NAMESPACE'
```

### Manifest for kind cluster

```bash
curl -O https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
kubectl apply -f deploy.yaml
```

```bash
kubectl wait --namespace ingress-nginx --for=condition=ready pod --selector=app.kubernetes.io/component=controller --timeout=90s
```
