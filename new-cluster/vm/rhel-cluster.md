# RHEL Cluster

## Start VMs

Start 3 CentOS node with Vagrant configuration.

```bash
vagrant up
```

## Prerequisites

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

# sudo systemctl enable --now firewalld
# sudo firewall-cmd --permanent --add-port={6443,2379-2380,10250,10251,10252,10255}/tcp
# sudo firewall-cmd --reload
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

Note: *Disable selinux to allow containers to access hosts filesystem*

## All Node

Install kubeadm and kubelet

```bash
sudo tee -a /etc/yum.repos.d/kubernetes.repo << EOF
[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/v1.31/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/v1.31/rpm/repodata/repomd.xml.key
exclude=kubelet kubeadm kubectl cri-tools kubernetes-cni
EOF
```

```bash
sudo yum install -y kubeadm kubelet --disableexcludes=kubernetes
# sudo yum install -y kubeadm-'1.31.*' kubelet-'1.31.*' --disableexcludes=kubernetes
```

Install kubectl

```bash
sudo yum install -y kubectl --disableexcludes=kubernetes
# curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
# sudo chmod +x kubectl
# sudo mv kubectl /usr/local/bin/kubectl
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

## Control Plane

Initialize cluster

```bash
control_node=192.168.56.101
cidr=192.168.128.0/17 # 192.168.0.0/16 # calico
sudo kubeadm init --pod-network-cidr=$cidr --apiserver-advertise-address=$control_node \
  --cri-socket=unix:///run/containerd/containerd.sock --v=5
```

Add kubeconfig

```bash
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

Install calico

```bash
version=$(curl https://api.github.com/repos/projectcalico/calico/releases/latest | jq -r .tag_name)
curl -LO https://raw.githubusercontent.com/projectcalico/calico/$version/manifests/calico.yaml
# curl -LO https://docs.projectcalico.org/manifests/calico.yaml
```

```bash
kubectl apply -f calico.yaml
```

Join control plane

```bash
sudo kubeadm join 192.168.56.101:6443 --token xxxx.xxxx --discovery-token-ca-cert-hash sha256:xxxx.xxxx \
  --controle-plane --certificate-key xxxx.xxxx --cri-socket=unix:///run/containerd/containerd.sock
```

## Worker Node

Add worker node in cluster

```bash
kubeadm token create --print-join-command
```

```bash
sudo kubeadm join 192.168.56.101:6443 --token xxxx.xxxx --discovery-token-ca-cert-hash sha256:xxxx.xxxx \
  --cri-socket=unix:///run/containerd/containerd.sock
```

Update label of worker node

```bash
kubectl label node worker-1 node-role.kubernetes.io/worker= # worker-2
```
