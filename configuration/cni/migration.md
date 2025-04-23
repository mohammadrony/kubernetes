# Migration

## Calico to Cilium

[Migrating from Calico - Isovalent](https://isovalent.com/labs/cilium-migrating-from-calico/)

Preparation

```bash
kubectl get installations.operator.tigera.io default \
  -o jsonpath='{.spec.calicoNetwork.ipPools[*].cidr}'
# 192.168.0.0/16
```

```bash
kubectl get installations.operator.tigera.io default \
  -o jsonpath='{.spec.calicoNetwork.ipPools[*].encapsulation}'
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
  -o jsonpath='{.spec.calicoNetwork.nodeAddressAutodetectionV4}'
# {"firstFound":true}
```

```bash
kubectl patch installations.operator.tigera.io default --type=merge \
  --patch '{"spec": {"calicoNetwork": {"nodeAddressAutodetectionV4": {"firstFound": false, "kubernetes": "NodeInternalIP"}}}}'
```

```bash
kubectl get installations.operator.tigera.io default \
  -o jsonpath='{.spec.calicoNetwork.nodeAddressAutodetectionV4}'
# {"firstFound":false,"kubernetes":"NodeInternalIP"}
```

Install Cilium

```bash
helm repo add cilium https://helm.cilium.io/
helm upgrade --install cilium cilium/cilium --namespace kube-system \
  --values values-initial.yaml
```

```bash
ls /etc/cni/net.d/
```
