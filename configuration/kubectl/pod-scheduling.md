# Pod Scheduling

## Cordon Uncordon

Disable scheduling for all pod

```bash
kubectl cordon NODE
```

Enable scheduling

```bash
kubectl uncordon NODE
```

## Node Selector

```yaml
spec:
  nodeSelector:
    node-role.kubernetes.io/control-plane: ""
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
