# Nginx Ingress and Load Balancer

## MetalLB load balancer

```bash
helm upgrade --install metallb oci://registry-1.docker.io/bitnamicharts/metallb --create-namespace --namespace metallb-system
```

IP pool

```bash
kubectl apply -f metallb.ip-pool.yaml
```

## Nginx Ingress

```bash
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
```

```bash
helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx --namespace ingress-nginx --create-namespace
```

```bash
kubectl get services -o wide --all-namespaces | grep -E 'LoadBalancer|NAMESPACE'
```
