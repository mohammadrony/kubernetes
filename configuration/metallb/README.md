# MetalLB Load Balancer

## Prerequisites

Install [cert-manager](../cert-manager/README.md)

## Manifest

YAML install

```bash
version=$(curl https://api.github.com/repos/metallb/metallb/releases/latest | jq -r .tag_name)
curl -O https://raw.githubusercontent.com/metallb/metallb/$version/config/manifests/metallb-native.yaml
kubectl apply -f metallb-native.yaml
```

```bash
# If memberlist secret not found
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
```

IP pool

```bash
kubectl apply -f metallb.ip-pool.yaml
```

## Helm chart

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
