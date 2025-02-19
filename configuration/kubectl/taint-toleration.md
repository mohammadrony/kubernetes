# Taint and Toleration

Get taints from node

```bash
kubectl get nodes NODE -o yaml | yq .spec.taints
```

```bash
kubectl get nodes -o yaml | yq '.items[].spec.taints'
# kubectl get nodes -o json | jq '.items[].spec.taints'
```

```bash
kubectl get nodes -o='custom-columns=NodeName:.metadata.name,TaintKey:.spec.taints[*].key,TaintValue:.spec.taints[*].value,TaintEffect:.spec.taints[*].effect'
```

Ignore `KEY=LABEL` labeled pod to be scheduled in specified `NODE`

```bash
kubectl taint nodes NODE KEY=LABEL:NoSchedule
```

Remove taint

```bash
kubectl taint nodes NODE KEY=LABEL:NoSchedule-
```

```bash
NODE=master
kubectl taint nodes $NODE node-role.kubernetes.io/control-plane:NoSchedule-
```

Taint toleration

```yaml
spec:
  tolerations:
  - key: "node-role.kubernetes.io/control-plane"
    operator: "Exists"
    effect: "NoSchedule"
```
