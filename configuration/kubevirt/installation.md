# KubeVirt

## Installation

Create namespace

```bash
kubectl create namespace kubevirt
```

Deploy KubeVirt

```bash
version=$(curl https://api.github.com/repos/kubevirt/kubevirt/releases/latest | jq -r .tag_name)

# operator
kubectl apply -f https://github.com/kubevirt/kubevirt/releases/download/$version/kubevirt-operator.yaml -n kubevirt

# custom resource
kubectl apply -f https://github.com/kubevirt/kubevirt/releases/download/$version/kubevirt-cr.yaml -n kubevirt
```

Get KubeVirt components

```bash
kubectl get kv -n kubevirt
```

Deploy KubeVirt CDI

```bash
version=$(curl https://api.github.com/repos/kubevirt/containerized-data-importer/releases/latest | jq -r .tag_name)

# operator
kubectl apply -f https://github.com/kubevirt/containerized-data-importer/releases/download/$version/cdi-operator.yaml -n kubevirt

# custom resource
kubectl apply -f https://github.com/kubevirt/containerized-data-importer/releases/download/$version/cdi-cr.yaml -n kubevirt
```

Get CDI components

```bash
kubectl get cdi -n kubevirt
```

```bash
echo "KubeVirt and CDI have been successfully deployed in the kubevirt namespace."
```
