# Nginx Ingress and Load Balancer

## MetalLB load balancer

Install with Helm

```bash
helm show values oci://registry-1.docker.io/bitnamicharts/metallb > values.metallb.yaml
```

Custom configuration

```bash
vi values.metallb.yaml
```

```bash
helm upgrade --install metallb oci://registry-1.docker.io/bitnamicharts/metallb --values values.metallb.yaml --create-namespace --namespace metallb-system
```

```bash
# curl -O https://raw.githubusercontent.com/metallb/metallb/v0.14.3/config/manifests/metallb-native.yaml
# kubectl apply -f metallb-native.yaml
# # If memberlist secret not found
# kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
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
helm show values ingress-nginx/ingress-nginx > values.ingress-nginx.yaml
```

Custom configuration

```bash
vi values.ingress-nginx.yaml
```

```bash
helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx --values values.ingress-nginx.yaml --namespace ingress-nginx --create-namespace
```

```bash
# curl -O https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.9.6/deploy/static/provider/baremetal/deploy.yaml
# kubectl apply -f deploy.yaml
```

```bash
kubectl get services -o wide --all-namespaces | grep -E 'LoadBalancer|NAMESPACE'
```
