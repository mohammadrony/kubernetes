# Kubectl Commands

## Cluster details

Cluster info

```bash
kubectl cluster-info
```

Namespace

```bash
kubectl get namespace
```

Pods

```bash
kubectl get pod
kubectl get pods
```

Deploy

```bash
kubectl get deploy
kubectl get deployment
```

Service

```bash
kubectl get svc
kubectl get service
```

Stateful sets

```bash
kubectl get sts
kubectl get statefulset
```

Options

```bash
kubectl get ... -o OUTPUT
kubectl get ... -n NAMESPACE
kubectl get ... -l KEY=VALUE
```

Logs

```bash
kubectl logs pod/PODNAME
kubectl logs svc/SERVICE
kubectl logs deploy/DEPLOYMENT
kubectl logs sts/STATEFULSET
```

Describe

```bash
kubectl describe pod PODNAME
kubectl describe svc SERVICE
kubectl describe deploy DEPLOYMENT
kubectl describe sts STATEFULSET
```

## Create and Update

Deploy objects

```bash
kubectl create -f FILE.yaml
```

```bash
kubectl apply -f FILE.yaml
```

```bash
kubectl run PODNAME --image=IMAGE:TAG
kubectl run PODNAME --image=IMAGE:TAG --port=PORT
```

Run commands

```bash
kubectl run -it busybox --image=busybox --rm -- sh
kubectl run -it shell --image giantswarm/tiny-tools --restart Never --rm -- sh
```

```bash
kubectl exec -it PODNAME -- COMMAND
```

Update

```bash
kubectl edit pod PODNAME
kubectl edit svc SERVICE
kubectl edit deploy DEPLOYMENT
kubectl edit sts STATEFULSET
```

Scale

```bash
kubectl scale --replicas=N PODNAME
kubectl scale --replicas=N DEPLOYMENT
kubectl scale --replicas=N STATEFULSET
```

Delete

```bash
kubectl delete pod PODNAME
kubectl delete svc SERVICE
kubectl delete deploy DEPLOYMENT
kubectl delete sts STATEFULSET
```

Copy files

```bash
kubectl cp PODNAME:/foo ./
kubectl cp ./ PODNAME:/foo
```

Open access

```bash
kubectl port-forward svc/SERVICE HOST_PORT:CONTAINER_PORT
```

```bash
kubectl expose svc/SERVICE --type=NodePort --target-port=CONTAINER_PORT --name=SERVICE_2
```

Restart

```bash
kubectl rollout restart pod PODNAME
kubectl rollout restart deploy DEPLOYMENT
kubectl rollout restart svc SERVICE
kubectl rollout restart sts STATEFULSET
```

Disable scheduling for node

```bash
kubectl cordon NODE
```

Enable scheduling for node

```bash
kubectl uncordon NODE
```
