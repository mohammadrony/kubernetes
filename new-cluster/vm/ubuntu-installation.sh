#!/bin/bash

# Ubuntu
sudo apt update

# Install basic packages
sudo apt install -y vim net-tools nmap telnet

# Set timezone
sudo timedatectl set-timezone Asia/Dhaka

# Set hosts

# Disable swap
sudo swapoff -a
sudo sed -i '/swap/d' /etc/fstab

# Enable IP forwarding
sudo tee -a /etc/sysctl.conf << EOF
net.ipv4.ip_forward = 1
EOF
sudo sysctl -p

# Install container runtime (containerd)
sudo apt install -y curl gnupg2 software-properties-common apt-transport-https ca-certificates
sudo apt install -y containerd.io
sudo mkdir -p /etc/containerd
containerd config default | sudo tee /etc/containerd/config.toml
sudo sed -i 's/\(SystemdCgroup = \).*/\1true/' /etc/containerd/config.toml
sudo systemctl enable --now containerd

# Containerd runtime setup
sudo tee /etc/crictl.yaml << EOF
runtime-endpoint: unix:///run/containerd/containerd.sock
image-endpoint: unix:///run/containerd/containerd.sock
EOF
sudo systemctl restart containerd
sudo crictl config --list

# Load necessary modules
sudo tee /etc/modules-load.d/k8s.conf << EOF
overlay
br_netfilter
EOF
sudo modprobe overlay
sudo modprobe br_netfilter

# Set up required sysctl params
sudo tee /etc/sysctl.d/k8s.conf << EOF
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF
sudo sysctl --system

# Kubernetes repository
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

# Install kubeadm kubelet
sudo apt update
sudo apt install -y kubeadm kubelet kubectl
sudo apt-mark hold kubeadm kubelet kubectl

sudo systemctl enable --now kubelet
sudo systemctl status kubelet
