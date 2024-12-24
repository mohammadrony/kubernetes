# Applications

Netshoot

```bash
kubectl run netshoot --image=nicolaka/netshoot -n default -- sleep infinity
# kubectl apply -f netshoot.yaml
```

```bash
kubectl exec -it netshoot -n default -- bash
```
