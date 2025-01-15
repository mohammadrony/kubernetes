# K3s Cluster

[Quick-Start Guide](https://docs.k3s.io/quick-start)

## Installation

Server

```bash
curl -sfL https://get.k3s.io -o install.sh

sh install.sh
rm -f install.sh
```

Copy kubeconfig

```bash
cd ~/.kube
sudo cp /etc/rancher/k3s/k3s.yaml k3s-config
sudo chown $USER: k3s-config
```

```bash
cd ~/.kube
cp config config.bak
cp k3s-config config
```

## Commands

```bash
kubectl get node
```

```bash
kubectl get pods -A
```

## Uninstall

[Uninstalling K3s](https://docs.k3s.io/installation/uninstall)

```bash
k3s-uninstall.sh
# /usr/local/bin/k3s-uninstall.sh
```
