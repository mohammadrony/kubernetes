# Logs

Pod logs

```bash
kubectl logs POD
kubectl logs pod/POD
```

```bash
kubectl logs svc/SERVICE
kubectl logs deploy/DEPLOYMENT
kubectl logs sts/STATEFULSET
```

Follow log realtime

```bash
kubectl logs POD -f
kubectl logs POD -f | grep -i ERROR
```

```bash
kubectl logs POD -f --tail
kubectl logs POD -f --tail 10
```

```bash
kubectl logs POD -f --since
kubectl logs POD -f --since 1m
kubectl logs POD -f --since 1h
```

Specify pods container name

```bash
kubectl logs pod/POD -c CONTAINER 
```

```bash
kubectl logs deploy/DEPLOYMENT -c CONTAINER 
```

Previous instance logs

```bash
kubectl logs POD --previous
```
