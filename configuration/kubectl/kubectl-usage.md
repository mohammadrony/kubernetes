# Kubectl Usage

## Kubeadm initial commands

```bash
sudo kubeadm init --pod-network-cidr=nnn.nnn.nnn.nnn/nn --apiserver-advertise-address=nnn.nnn.nnn.nnn
```

```bash
kubeadm token create --print-join-command
```

## Cluster details

```bash
kubectl cluster-info
```

### Nodes

```bash
kubectl get no
kubectl get nodes
```

### Namespace

```bash
kubectl get ns
kubectl get namespace
```

### Pods

```bash
kubectl get pod
kubectl get pods
```

```bash
kubectl get pods --all-namespaces -o wide --field-selector spec.nodeName=<node>
```

### Deployment

```bash
kubectl get deploy
kubectl get deployment
```

### Service

```bash
kubectl get svc
kubectl get service
```

### Stateful sets

```bash
kubectl get sts
kubectl get statefulset
```

### Service account

```bash
kubectl get sa
kubectl get serviceaccount
```

### Secrets

```bash
kubectl get secrets
```

### Config map

```bash
kubectl get cm
kubectl get configmap
```

### Role

```bash
kubectl get role
```

### Role binding

```bash
kubectl get rb
kubectl get rolebinding
```

### Get options

```bash
kubectl get ... -o OUTPUT
kubectl get ... -n NAMESPACE
kubectl get ... -l KEY=VALUE
kubectl get ... --field-selector spec.nodeName=<node>
```

### Logs

```bash
kubectl logs pod/PODNAME
kubectl logs svc/SERVICE
kubectl logs deploy/DEPLOYMENT
kubectl logs sts/STATEFULSET
kubectl logs cm/CONFIGMAP
kubectl logs secret/SECRET
kubectl logs sa/SERVICEACCOUNT
kubectl logs role/ROLE
kubectl logs rb/ROLEBINDING
```

### Describe

```bash
kubectl describe pod PODNAME
kubectl describe svc SERVICE
kubectl describe deploy DEPLOYMENT
kubectl describe sts STATEFULSET
kubectl describe cm/CONFIGMAP
kubectl describe secret/SECRET
kubectl describe sa/SERVICEACCOUNT
kubectl describe role/ROLE
kubectl describe rb/ROLEBINDING
```

## Create and Update

### Deploy

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

### Run

```bash
kubectl run -it busybox --image=busybox --rm -- sh
kubectl run -it shell --image giantswarm/tiny-tools --restart Never --rm -- sh
```

```bash
kubectl exec -it PODNAME -- COMMAND
```

```bash
kubectl exec PODNAME -- env
```

### Update

```bash
kubectl edit pod PODNAME
kubectl edit svc SERVICE
kubectl edit deploy DEPLOYMENT
kubectl edit sts STATEFULSET
```

### Scale

```bash
kubectl scale --replicas=N PODNAME
kubectl scale --replicas=N DEPLOYMENT
kubectl scale --replicas=N STATEFULSET
```

### Delete

```bash
kubectl delete pod PODNAME
kubectl delete svc SERVICE
kubectl delete deploy DEPLOYMENT
kubectl delete sts STATEFULSET
```

```bash
kubectl delete pods -l <key>=<value>
kubectl delete pods --field-selector spec.nodeName=<node>
```

### Copy files

```bash
kubectl cp PODNAME:/file ./
kubectl cp ./ PODNAME:/file
```

### Enable access

```bash
kubectl port-forward svc/SERVICE HOST_PORT:CONTAINER_PORT
```

```bash
kubectl expose svc/SERVICE --type=NodePort --target-port=CONTAINER_PORT --name=SERVICE_2
```

### Restart

```bash
kubectl rollout restart pod PODNAME
kubectl rollout restart deploy DEPLOYMENT
kubectl rollout restart svc SERVICE
kubectl rollout restart sts STATEFULSET
```

### Schedule

Disable scheduling for node

```bash
kubectl cordon NODE
```

Enable scheduling for node

```bash
kubectl uncordon NODE
```
