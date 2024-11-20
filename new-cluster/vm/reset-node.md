# Reset Node

Delete node from cluster

```bash
NODE='<node>'
kubectl drain $NODE --ignore-daemonsets --delete-local-data
kubectl cordon $NODE
kubectl delete node $NODE
```

Reset k8s node

```bash
sudo kubeadm reset -f
sudo rm -rf /etc/cni/net.d
sudo systemctl restart containerd
```

Reset VM

```bash
sudo rm -f /etc/yum.repos.d/kubernetes.repo
sudo rm -f /etc/containerd/config.toml
sudo rm -f /etc/modules-load.d/k8s.conf
sudo rm -f /etc/sysctl.d/k8s.conf
```

Ubuntu package remove

```bash
sudo apt-mark unhold containerd.io kubelet kubeadm
sudo apt remove -y containerd
sudo apt remove -y kubelet kubeadm
```

RHEL package remove

```bash
sudo dnf remove -y containerd
sudo dnf remove -y kubelet kubeadm
```
