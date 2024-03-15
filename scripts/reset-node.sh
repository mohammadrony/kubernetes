#!/bin/bash
# Reset k8s node
sudo kubeadm reset -f
sudo rm -rf /etc/cni/net.d
sudo systemctl restart containerd

# Reset CentOS VM for specific configuration
sudo rm -f /etc/yum.repos.d/kubernetes.repo
sudo rm -f /etc/containerd/config.toml
sudo rm -f /etc/modules-load.d/k8s.conf
sudo rm -f /etc/sysctl.d/k8s.conf
sudo dnf remove -y containerd
sudo dnf remove -y kubelet kubeadm kubectl
