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

```bash
kubectl api-versions
```

```bash
kubectl api-resources
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

### Stateful statefulset

```bash
kubectl get sts
kubectl get statefulset
```

### Auto scaler

```bash
kubectl get hpa
kubectl get horizontalpodautoscaler
```

### Service account

```bash
kubectl get sa
kubectl get serviceaccount
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

### Describe

```bash
kubectl describe pod POD
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
kubectl run POD --image=IMAGE:TAG
kubectl run POD --image=IMAGE:TAG --port=PORT
```

### Run

Useful containers

```bash
kubectl run -it busybox --image=busybox --rm -- sh
kubectl run -it shell --image giantswarm/tiny-tools --restart Never --rm -- sh
```

Login shell

```bash
kubectl exec -it POD -- COMMAND
```

Environment variable

```bash
kubectl exec POD -- env
kubectl exec POD -- printenv
```

### Update

```bash
kubectl edit pod POD
kubectl edit svc SERVICE
kubectl edit deploy DEPLOYMENT
kubectl edit sts STATEFULSET
```

Patch

```bash
kubectl patch pod POD --type='json' -p='[{"op": "add", "path": "/spec/containers/0/env/-", "value": {"name": "MODE", "value": "production"}}]'
```

```bash
kubectl patch pod POD --type='json' -p='[{"op": "replace", "path": "/spec/containers/0/image", "value": "IMAGE:TAG"}]'
```

```bash
kubectl patch pod POD --type='json' -p='[{"op": "remove", "path": "/spec/nodeSelector"}]'
```

### Scale

```bash
kubectl scale --replicas=N REPLICASET
kubectl scale --replicas=N DEPLOYMENT
kubectl scale --replicas=N STATEFULSET
```

```bash
kubectl autoscale deployment DEPLOYMENT --cpu-percent=50 --min=1 --max 5
```

### Delete

```bash
kubectl delete pod POD
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
kubectl cp POD:/file ./
kubectl cp ./ POD:/file
```

### Expose service

```bash
kubectl port-forward svc/SERVICE HOST_PORT:CONTAINER_PORT
```

```bash
kubectl expose DEPLOYMENT SERVICE --port CONTAINER_PORT
```

```bash
kubectl expose svc/SERVICE --type=NodePort --target-port=CONTAINER_PORT --name=SERVICE_2
```

### Rollout

```bash
kubectl rollout restart pod POD
kubectl rollout restart deploy DEPLOYMENT
kubectl rollout restart svc SERVICE
kubectl rollout restart sts STATEFULSET
```

```bash
kubectl rollout status deploy DEPLOYMENT
```

```bash
kubectl rollout history deploy DEPLOYMENT
kubectl rollout history deploy DEPLOYMENT --revision=N
```

```bash
kubectl rollout undo deployment DEPLOYMENT --to-revision=N
```
