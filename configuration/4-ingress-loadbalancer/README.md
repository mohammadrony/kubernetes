# Nginx Ingress and Load Balancer

## MetalLB load balancer

```bash
# helm upgrade --install metallb oci://registry-1.docker.io/bitnamicharts/metallb --create-namespace --namespace metallb-system
```

```bash
curl -O https://raw.githubusercontent.com/metallb/metallb/v0.14.3/config/manifests/metallb-native.yaml
kubectl apply -f metallb-native.yaml
```

IP pool

```bash
kubectl apply -f metallb.ip-pool.yaml
```

## Nginx Ingress

```bash
# helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
# helm repo update
# helm show values ingress-nginx/ingress-nginx > ingress-nginx.values.yaml
# helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx --namespace ingress-nginx --create-namespace
```

```bash
curl -O https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.9.6/deploy/static/provider/baremetal/deploy.yaml
kubectl apply -f deploy.yaml
```

```bash
kubectl get services -o wide --all-namespaces | grep -E 'LoadBalancer|NAMESPACE'
```
