# Kubectl Get

## Resources

Core components

```bash
kubectl get componentstatuses
```

Nodes

```bash
kubectl get no
kubectl get nodes
```

Namespace

```bash
kubectl get ns
kubectl get namespace
```

Pods

```bash
kubectl get pod
kubectl get pods
```

Deployment

```bash
kubectl get deploy
kubectl get deployment
```

Service

```bash
kubectl get svc
kubectl get service
```

Statefulset

```bash
kubectl get sts
kubectl get statefulset
```

Auto scaler

```bash
kubectl get hpa
kubectl get horizontalpodautoscaler
```

Service account

```bash
kubectl get sa
kubectl get serviceaccount
```

Role

```bash
kubectl get role
```

Role binding

```bash
kubectl get rb
kubectl get rolebinding
```

## Options

```bash
kubectl get ... -o OUTPUT
kubectl get ... -n NAMESPACE
kubectl get ... -l KEY=VALUE
kubectl get ... --sort-by='FIELD'
kubectl get ... --field-selector spec.nodeName=<node>
```

Examples

```bash
kubectl get ... -o name
kubectl get ... --no-headers
```

## Examples

Get all namespace pods

```bash
kubectl get pods --all-namespaces
```

Sort by field

```bash
kubectl get pods --sort-by=cpu
kubectl get pods --sort-by=.metadata.name
```

Pods for specific node

```bash
kubectl get pods --all-namespaces -o wide --field-selector spec.nodeName=<node>
```

Custom fields for resource (e.g: node,taints)

```bash
kubectl get nodes --output custom-columns=NODE_NAME:.metadata.name,TAINTS:.spec.taints
```
