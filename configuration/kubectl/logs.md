# Logs

Available logs

```bash
kubectl logs pod/PODNAME
kubectl logs svc/SERVICE
kubectl logs deploy/DEPLOYMENT
kubectl logs sts/STATEFULSET
```

Container logs

```bash
kubectl logs deploy/DEPLOYMENT -c CONTAINER 
```
