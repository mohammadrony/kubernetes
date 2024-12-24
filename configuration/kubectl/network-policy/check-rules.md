# Check Rules

## Use Case

```bash
kubectl auth can-i -h
```

Format

```bash
kubectl auth can-i VERB RESOURCE -n NAMESPACE --as=system:serviceaccount:NAMESPACE:SERVICEACCOUNT
```

- Verb: `get`, `list`, `watch`, `logs`, `create`, `patch`, `update`, `bind`, `delete` etc.
- Resource: `nodes`, `namespaces`, `pods`, `pods/logs`, `pods/exec`, `deployments`, `services`, `events`, `ingresses`, `secrets`, `configmaps`,

## Examples

### All Action

List all allowed actions in default namespace

```bash
kubectl auth can-i --list -n default
```

Get all resource in default namespace

```bash
kubectl auth can-i get '*' -n default
```

Can I do all operation in all namespace

```bash
kubectl auth can-i '*' '*' --all-namespaces
```

### Specific Action

Create pods in all namespace

```bash
kubectl auth can-i create pods -A
```

Get pods in default namespace

```bash
kubectl auth can-i get pods --namespace=default
```

Get pod logs as subresource in current namespace

```bash
kubectl auth can-i get pods/logs
kubectl auth can-i get pods --subresource='logs'
```

List deployments in all namespace

```bash
kubectl auth can-i list deployments.apps --all-namespaces
```
