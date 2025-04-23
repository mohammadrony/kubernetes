# Applications

## Netshoot

```bash
kubectl run netshoot --image=nicolaka/netshoot -n default -- sleep infinity
# kubectl apply -f netshoot.yaml
```

```bash
kubectl exec -it netshoot -n default -- bash
```

## Goldpinger

- [Github - goldpinger](https://github.com/bloomberg/goldpinger)

Helm chart

```bash
helm repo add goldpinger https://bloomberg.github.io/goldpinger
helm repo update
helm install goldpinger goldpinger/goldpinger
```

```bash
kubectl expose service goldpinger --name goldpinger-nodeport --type=NodePort --port 8080 \
  --overrides '{"spec":{"ports": [{"port":80,"protocol":"TCP","targetPort":8080,"nodePort":30080}]}}'
```

Manifest

```bash
kubectl apply -f goldpinger.yaml
```

Status check

```bash
curl -s http://127.0.0.1:30080/check | jq
```

```bash
curl -s http://127.0.0.1:30080/metrics | grep '^goldpinger_nodes_health_total'
```
