# KubeVirt

## Installation

Create namespace

```bash
kubectl create namespace kubevirt
```

Label control plane

```bash
node=<node-name>
kubectl label node $node node-role.kubernetes.io/control-plane=
```

Deploy KubeVirt

```bash
version=$(curl https://api.github.com/repos/kubevirt/kubevirt/releases/latest | jq -r .tag_name)

# operator
kubectl apply -n kubevirt -f https://github.com/kubevirt/kubevirt/releases/download/$version/kubevirt-operator.yaml

# custom resource
kubectl apply -n kubevirt -f https://github.com/kubevirt/kubevirt/releases/download/$version/kubevirt-cr.yaml
```

Get KubeVirt components

```bash
kubectl get kv -n kubevirt
```

Deploy KubeVirt CDI

```bash
version=$(curl https://api.github.com/repos/kubevirt/containerized-data-importer/releases/latest | jq -r .tag_name)

# operator
kubectl apply -n kubevirt -f https://github.com/kubevirt/containerized-data-importer/releases/download/$version/cdi-operator.yaml

# custom resource
kubectl apply -n kubevirt -f https://github.com/kubevirt/containerized-data-importer/releases/download/$version/cdi-cr.yaml
```

Get CDI components

```bash
kubectl get cdi -n kubevirt
```
