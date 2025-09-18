# RHEL Node Configuration

Update system

```bash
sudo dnf update -y
```

Install packages

```bash
sudo dnf install -y vim net-tools nmap telnet
```

Set timezone

```bash
sudo timedatectl set-timezone Asia/Dhaka
```

Disable swap

```bash
sudo swapoff -a
sudo sed -i '/swap/d' /etc/fstab
```

Disable firewall

```bash
sudo systemctl disable --now firewalld
```

Install containerd runtime

```bash
sudo dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
sudo dnf install -y containerd.io
sudo mkdir -p /etc/containerd
containerd config default | sudo tee /etc/containerd/config.toml
sudo sed -i 's/\(SystemdCgroup = \).*/\1true/' /etc/containerd/config.toml
sudo systemctl enable --now containerd
```

Disable Apparmor

```bash
sudo systemctl disable --now apparmor
sudo systemctl restart containerd
```

Load necessary modules

```bash
sudo tee /etc/modules-load.d/k8s.conf << EOF
overlay
br_netfilter
EOF

sudo modprobe overlay
sudo modprobe br_netfilter
```

Set up required sysctl params

```bash
sudo tee /etc/sysctl.d/k8s.conf << EOF
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF

sudo sysctl --system
```

Disable selinux

```bash
sudo setenforce 0
sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config
```

Install kubeadm kubelet

```bash
sudo tee -a /etc/yum.repos.d/kubernetes.repo << EOF
[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/v1.34/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/v1.34/rpm/repodata/repomd.xml.key
exclude=kubelet kubeadm kubectl cri-tools kubernetes-cni
EOF
```

```bash
sudo yum install -y kubeadm kubelet --disableexcludes=kubernetes
# sudo yum install -y kubeadm-'1.34.*' kubelet-'1.34.*' --disableexcludes=kubernetes
```

Install kubectl

```bash
sudo yum install -y kubectl --disableexcludes=kubernetes
# sudo yum install -y kubectl-'1.34.*' --disableexcludes=kubernetes
```

Alias

```bash
echo 'alias k="kubectl"' >> ~/.bash_aliases
```

Auto completion

```bash
echo 'complete -o default -F __start_kubectl k' >> ~/.bashrc
```

Start kubelet

```bash
sudo systemctl enable --now kubelet
```
