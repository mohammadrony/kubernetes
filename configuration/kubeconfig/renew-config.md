# Renew Config

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
