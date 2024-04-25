# Load Balancer

## MetalLB Load Balancer

### MetalLB Helm chart

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

### MetalLB Manifest

```bash
curl -O https://raw.githubusercontent.com/metallb/metallb/v0.14.3/config/manifests/metallb-native.yaml
kubectl apply -f metallb-native.yaml
# If memberlist secret not found
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
```

IP pool

```bash
kubectl apply -f metallb.ip-pool.yaml
```
