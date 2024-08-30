# Pod Scheduling

## Node selector

```yaml
spec:
  nodeSelector:
    node-role.kubernetes.io/control-plane: ""
```

## Taint and Toleration

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

Taint toleration

```yaml
spec:
  tolerations:
  - key: "node-role.kubernetes.io/control-plane"
    operator: "Exists"
    effect: "NoSchedule"
```

## Affinity Anti-affinity

Node affinity

```yaml
# Pod will be scheduled in a node having 'disk-type=ssd' label
spec:
  affinity:
    nodeAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
        nodeSelectorTerms:
        - matchExpressions:
          - key: disk-type
            operator: In
            values:
            - ssd
```

```yaml
# Pod will try to schedule in a node having 'disk-type=ssd' label
spec:
  affinity:
    nodeAffinity:
      preferredDuringSchedulingIgnoredDuringExecution:
        - weight: 100
          preference:
            matchExpressions:
              - key: disk-type
                operator: In
                values:
                  - ssd
```

Pod affinity

```yaml
# Pod will be scheduled in a node having 'app=frontend' labeled pod 
spec:
  affinity:
    podAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
      - labelSelector:
          matchExpressions:
          - key: app
            operator: In
            values:
            - frontend
          # matchLabels:
          #   app: frontend
        topologyKey: kubernetes.io/hostname
```

```yaml
# Pod will try to schedule in a node having 'app=backend' labeled pod 
spec:
  affinity:
    podAffinity:
      preferredDuringSchedulingIgnoredDuringExecution:
      - weight: 100
        podAffinityTerm:
          labelSelector:
            matchExpressions:
            - key: app
              operator: In
              values:
              - backend
            # matchLabels:
            #   app: backend
          topologyKey: kubernetes.io/hostname
```

Pod anti-affinity

```yaml
# Pod won't be scheduled in a node having 'app=frontend' labeled pod 
spec:
  affinity:
    podAntiAffinity:
      requiredDuringSchedulingIgnoredDuringExecution:
      - labelSelector:
          matchExpressions:
          - key: app
            operator: In
            values:
            - frontend
          # matchLabels:
          #   app: frontend
        topologyKey: kubernetes.io/hostname
```

```yaml
# Pod will try not to schedule in a node having 'app=backend' labeled pod 
spec:
  affinity:
    podAntiAffinity:
      preferredDuringSchedulingIgnoredDuringExecution:
      - weight: 100
        podAffinityTerm:
          labelSelector:
            matchExpressions:
            - key: app
              operator: In
              values:
              - backend
            # matchLabels:
            #   app: backend
          topologyKey: kubernetes.io/hostname
```

## Scheduling Gate

Block scheduling a pod

```yaml
spec:
  schedulingGates:
  - name: example.com/foo
```

Get scheduled by removing gates

```bash
kubectl patch pod POD --type='json' -p='[{"op": "remove", "path": "/spec/schedulingGates"}]'
```

## Cordon Uncordon

Disable scheduling for all pod

```bash
kubectl cordon NODE
```

Enable scheduling

```bash
kubectl uncordon NODE
```
