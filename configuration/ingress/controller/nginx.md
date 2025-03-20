# Nginx Ingress Controller

## Baremetal cluster controller

YAML install

```bash
version=$(curl https://api.github.com/repos/kubernetes/ingress-nginx/releases/latest | jq -r .tag_name)
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/$version/deploy/static/provider/baremetal/deploy.yaml
```

Update service type

```bash
kubectl patch svc ingress-nginx-controller -n ingress-nginx --type='merge' -p '
{
  "spec": {
    "type": "LoadBalancer",
    "ports": [
      {
        "name": "http",
        "port": 80,
        "targetPort": 80,
        "nodePort": 30080
      },
      {
        "name": "https",
        "port": 443,
        "targetPort": 443,
        "nodePort": 30443
      }
    ]
  }
}'
```

```bash
kubectl get services -o wide --all-namespaces | grep -E 'LoadBalancer|NAMESPACE'
```

## Kind cluster controller

YAML install

```bash
version=$(curl https://api.github.com/repos/kubernetes/ingress-nginx/releases/latest | jq -r .tag_name)
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/$version/deploy/static/provider/kind/deploy.yaml
```

```bash
kubectl get pods -n ingress-nginx
```

## Nginx chart

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
