# Modify

## Edit

```bash
kubectl edit pod POD
kubectl edit svc SERVICE
kubectl edit deploy DEPLOYMENT
kubectl edit sts STATEFULSET
```

## Scale

```bash
kubectl scale --replicas=N REPLICASET
kubectl scale --replicas=N DEPLOYMENT
kubectl scale --replicas=N STATEFULSET
```

```bash
kubectl autoscale deployment DEPLOYMENT --cpu-percent=50 --min=1 --max 5
```

## Patch

Add

```bash
kubectl patch pod POD --type='json' -p='[{"op": "add", "path": "/spec/containers/0/env/-", "value": {"name": "MODE", "value": "production"}}]'
```

Replace

```bash
kubectl patch pod POD --type='json' -p='[{"op": "replace", "path": "/spec/containers/0/image", "value": "IMAGE:TAG"}]'
```

Remove

```bash
kubectl patch pod POD --type='json' -p='[{"op": "remove", "path": "/spec/nodeSelector"}]'
```
