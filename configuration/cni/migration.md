# Migration

## Calico to Cilium

[Migrating from Calico - Isovalent](https://isovalent.com/labs/cilium-migrating-from-calico/)

Preparation

```bash
kubectl get installations.operator.tigera.io default \
  -o jsonpath='{.spec.calicoNetwork.ipPools[*].cidr}{"\n"}'
# 192.168.0.0/16
```

```bash
kubectl get installations.operator.tigera.io default \
  -o jsonpath='{.spec.calicoNetwork.ipPools[*].encapsulation}{"\n"}'
# VXLANCrossSubnet
```

Generate helm values

```bash
cat values-migration.yaml
```

```bash
cilium install \
  --helm-values values-migration.yaml \
  --dry-run-helm-values > values-initial.yaml
```

Prevent calico from using cilium interface

```bash
kubectl get installations.operator.tigera.io default \
  -o jsonpath='{.spec.calicoNetwork.nodeAddressAutodetectionV4}{"\n"}'
# {"firstFound":true}
```

```bash
kubectl patch installations.operator.tigera.io default --type=merge \
  --patch '{"spec": {"calicoNetwork": {"nodeAddressAutodetectionV4": {"firstFound": false, "kubernetes": "NodeInternalIP"}}}}'
```

```bash
kubectl get installations.operator.tigera.io default \
  -o jsonpath='{.spec.calicoNetwork.nodeAddressAutodetectionV4}{"\n"}'
# {"firstFound":false,"kubernetes":"NodeInternalIP"}
```

Install Cilium

```bash
helm repo add cilium https://helm.cilium.io/
helm upgrade --install cilium cilium/cilium --namespace kube-system \
  --values values-initial.yaml
```

Check CNI configuration

```bash
sudo ls /etc/cni/net.d/
```

```bash
kubectl apply --server-side -f ciliumnodeconfig.yaml
```

Currently nodes doesn't have `io.cilium.migration/cilium-default: "true"` condition

```bash
kubectl get no --show-labels
```

### Start Migrating

Cordon and drain node

```bash
NODE="worker"
kubectl cordon $NODE
kubectl drain $NODE --ignore-daemonsets
kubectl get pods -o wide --field-selector spec.nodeName=$NODE
```

Label and restart

```bash
kubectl label node $NODE --overwrite "io.cilium.migration/cilium-default=true"
```

```bash
kubectl -n kube-system delete pod --field-selector spec.nodeName=$NODE -l k8s-app=cilium
kubectl -n kube-system rollout status ds/cilium -w
```
