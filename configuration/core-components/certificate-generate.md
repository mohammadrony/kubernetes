# Certificate Generate

## Generate New Certificate

all certificate in `/etc/kubernetes/pki/` directory

- `sudo kubeadm init phase certs all --apiserver-advertise-address <IP>`

apiserver certificate with host address

```bash
sudo rm /etc/kubernetes/pki/apiserver.*
sudo kubeadm init phase certs apiserver --apiserver-cert-extra-sans=<private-or-public-ip>
```

## Renew Certificate

Renew certificates in `/etc/kubernetes/pki/` directory

```bash
sudo kubeadm certs renew -h
```

```bash
sudo kubeadm certs renew all
```

```bash
sudo kubeadm certs renew apiserver
```

Check expiration date

```bash
sudo kubeadm certs check-expiration
```

Restart pods with new certificate

```bash
kubectl delete pod -n kube-system -l component=kube-apiserver
kubectl delete pod -n kube-system -l component=kube-scheduler
kubectl delete pod -n kube-system -l component=kube-controller-manager
kubectl delete pod -n kube-system -l component=etcd
```
