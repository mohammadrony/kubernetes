# Load Balancer

## MetalLB Load Balancer

### Pre-requisites

Install [cert-manager](../cert-manager/)

### MetalLB Manifest

[Releases](https://github.com/metallb/metallb/releases)

```bash
# curl -O https://raw.githubusercontent.com/metallb/metallb/main/config/manifests/metallb-native.yaml
curl -O https://raw.githubusercontent.com/metallb/metallb/v0.14.3/config/manifests/metallb-native.yaml
kubectl apply -f metallb-native.yaml
# If memberlist secret not found
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
```

IP pool

```bash
kubectl apply -f metallb.ip-pool.yaml
```

### MetalLB Helm chart

Install with Helm

```bash
helm show values oci://registry-1.docker.io/bitnamicharts/metallb > values.metallb.yaml
```

```bash
helm install metallb oci://registry-1.docker.io/bitnamicharts/metallb --create-namespace --namespace metallb-system
```

Custom configuration

```bash
vi values.metallb.yaml
```

```bash
helm upgrade --install metallb oci://registry-1.docker.io/bitnamicharts/metallb --values values.metallb.yaml --create-namespace --namespace metallb-system
```
