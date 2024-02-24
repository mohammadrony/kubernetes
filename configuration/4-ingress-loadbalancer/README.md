# Nginx Ingress and Load Balancer

## MetalLB load balancer

```bash
vi values.yaml
```

```yaml
controller:
  resources:
    requests:
      memory: "512Mi"
      cpu: "500m"
    limits:
      memory: "1024Mi"
      cpu: "1000m"

speaker:
  resources:
    requests:
      memory: "512Mi"
      cpu: "500m"
    limits:
      memory: "1024Mi"
      cpu: "1000m"
```

```bash
helm upgrade --install metallb oci://registry-1.docker.io/bitnamicharts/metallb --values values.yaml --create-namespace --namespace metallb-system
```

IP pool

```bash
vi metallb-ip.yaml
```

```yaml
apiVersion: metallb.io/v1beta1
kind: IPAddressPool
metadata:
  name: ip-pool
  namespace: metallb-system
spec:
  addresses:
    - <loadbalancer-ip>

---
apiVersion: metallb.io/v1beta1
kind: L2Advertisement
metadata:
  name: metallb-ip-space
  namespace: metallb-system
spec:
  ipAddressPools:
    - ip-pool
```

```bash
kubectl apply -f metallb-ip.yaml
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
