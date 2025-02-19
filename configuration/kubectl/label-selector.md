# Label and Selector

## Label

Get pod labels

```bash
kubectl get pods --show-labels
kubectl get pods -o wide --show-labels
```

Get node labels

```bash
kubectl get nodes --show-labels
```

Add label in a node

```bash
kubectl label nodes NODE KEY=VALUE
```

Update label value

```bash
kubectl label nodes NODE KEY=VALUE --overwrite
```

Remove label from node

```bash
kubectl label nodes NODE KEY-
```

Update worker node label

```bash
NODE=worker
kubectl label node $NODE node-role.kubernetes.io/worker=
```

## Selector

Get resources

```bash
kubectl get ... -l '<key>=<value>'
kubectl get ... -l 'ENV in (staging, production)'
kubectl get ... --field-selector spec.nodeName=<node>
```

Delete resources

```bash
kubectl delete ... -l '<key>=<value>'
kubectl delete ... -l 'ENV in (staging, production)'
kubectl delete ... --field-selector spec.nodeName=<node>
```
