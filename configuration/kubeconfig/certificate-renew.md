# Cluster Certificate Renew

Renew certificate

```bash
sudo kubeadm certs renew all
```

```bash
sudo systemctl restart kubelet
```

Update kubeconfig

```bash
cp ~/.kube/config ~/.kube/$(date --iso)-config
sudo cp /etc/kubernetes/admin.conf ~/.kube/config
sudo chown $USER: ~/.kube/config
```
