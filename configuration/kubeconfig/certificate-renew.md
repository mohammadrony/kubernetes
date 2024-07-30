# Certificate Renew

## Certificate

Renew certificates in `/etc/kubernetes/pki/` directory

```bash
sudo kubeadm certs renew all
```

```bash
sudo kubeadm certs check-expiration
```

```bash
kubectl delete pod -n kube-system -l component=kube-apiserver
kubectl delete pod -n kube-system -l component=kube-scheduler
kubectl delete pod -n kube-system -l component=kube-controller-manager
kubectl delete pod -n kube-system -l component=etcd
```

## Renew Config

Generate admin kubeconfig

```bash
sudo kubeadm init phase kubeconfig admin
```

Generate all kubeconfig

```bash
sudo kubeadm init phase kubeconfig all
```

## Update Kubeconfig

```bash
cp ~/.kube/config ~/.kube/$(date --iso)-config
sudo cp /etc/kubernetes/admin.conf ~/.kube/config
sudo chown $USER: ~/.kube/config
```
