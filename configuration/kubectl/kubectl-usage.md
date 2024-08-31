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
kubectl api-resources --namespaced
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

### Login Shell

```bash
kubectl exec -it POD -- COMMAND
```

Environment variable

```bash
kubectl exec POD -- env
kubectl exec POD -- printenv
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

Delete pod immediately

```bash
kubectl delete pod POD --force --grace-period 0
```

### Copy files

```bash
kubectl cp POD:/file ./
kubectl cp ./ POD:/file
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
