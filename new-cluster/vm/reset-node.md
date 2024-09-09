# Reset Node

Delete node from cluster

```bash
NODE='cad-reg-worker-8'
kubectl drain $NODE --ignore-daemonsets
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

```bash
# Redhat
sudo dnf remove -y containerd
sudo dnf remove -y kubelet kubeadm kubectl
```

```bash
sudo apt-mark unhold
sudo apt remove -y containerd.io
sudo apt remove -y kubelet kubeadm kubectl
```
