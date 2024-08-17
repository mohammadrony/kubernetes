# YQ Usage

Get pod info

```bash
kubectl get pods POD -o yaml | yq ".spec.containers[0].image"
```

Get nodename by selecting pod

```bash
kubectl get pods -l KEY=VALUE -o yaml | yq ".items[] | .spec.nodeName" 
```
