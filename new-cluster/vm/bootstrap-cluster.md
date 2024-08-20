# Bootstrap Cluster

## Prerequisites

Start 3 CentOS Node with some common configuration from [Vagrantfile](./Vagrantfile).

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
baseurl=https://pkgs.k8s.io/core:/stable:/v1.30/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/v1.30/rpm/repodata/repomd.xml.key
exclude=kubelet kubeadm kubectl cri-tools kubernetes-cni
EOF
```

```bash
sudo yum install -y kubeadm kubelet --disableexcludes=kubernetes
# sudo yum install -y kubeadm-'1.30.*' kubelet-'1.30.*' --disableexcludes=kubernetes
```

Install kubectl

```bash
sudo yum install -y kubectl --disableexcludes=kubernetes
# curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
# sudo chmod +x kubectl
# sudo mv kubectl /usr/local/bin/kubectl
```

Start kubelet

```bash
sudo systemctl enable --now kubelet
```

## Control Plane

Initialize cluster

```bash
control_node=192.168.56.111
cidr=192.168.128.0/17 # 192.168.0.0/16 # calico
sudo kubeadm init --v=5 --cri-socket=unix:///run/containerd/containerd.sock --pod-network-cidr=$cidr \
  --apiserver-advertise-address=$control_node
```

Add kubeconfig

```bash
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

Install calico

```bash
version=3.28.0 # https://github.com/projectcalico/calico/releases
curl -LO https://raw.githubusercontent.com/projectcalico/calico/v$version/manifests/calico.yaml
# curl -LO https://docs.projectcalico.org/manifests/calico.yaml
```

```bash
kubectl apply -f calico.yaml
```

Join control plane

```bash
sudo kubeadm join 192.168.56.111:6443 --token xxxx.xxxx --discovery-token-ca-cert-hash sha256:xxxx.xxxx \
  --controle-plane --certificate-key xxxx.xxxx --cri-socket=unix:///run/containerd/containerd.sock
```

## Worker Node

Add worker node in cluster

```bash
kubeadm token create --print-join-command
```

```bash
sudo kubeadm join 192.168.56.111:6443 --token xxxx.xxxx --discovery-token-ca-cert-hash sha256:xxxx.xxxx \
  --cri-socket=unix:///run/containerd/containerd.sock
```

Update label of worker node

```bash
kubectl label node kube-worker-1 node-role.kubernetes.io/worker= # kube-worker-2
```
