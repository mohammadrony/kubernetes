# YQ Usage

Different use of yq for python and go version

```bash
# Python
k get pods POD -o yaml | yq '.metadata.name'
```

```bash
# GO
k get pods POD -o yaml | yq eval '.metadata.name' -
```

Get pod info

```bash
kubectl get pods -o yaml | yq ".items[] | .metadata.name"
```

```bash
kubectl get pods POD -o yaml | yq ".spec.containers[0].image"
```

Get nodename by selecting pod

```bash
kubectl get pods -l KEY=VALUE -o yaml | yq ".items[] | .spec.nodeName"
```
