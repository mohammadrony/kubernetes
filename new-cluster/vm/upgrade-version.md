# Upgrade Version

## Repository

Debian

```bash
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.31/deb/Release.key | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.31/deb/ /' | tee /etc/apt/sources.list.d/kubernetes.list
```

RHEL

```bash
sudo tee /etc/yum.repos.d/kubernetes.repo << EOF
[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/v1.31/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/v1.31/rpm/repodata/repomd.xml.key
exclude=kubelet kubeadm kubectl cri-tools kubernetes-cni
EOF
```

## Kubeadm

Upgrade binary

```bash
apt-cache madison kubeadm
````

```bash
# Debian
sudo apt update
sudo apt-mark unhold kubeadm
sudo apt install -y kubeadm
# sudo apt install -y kubeadm='1.31.x*'
sudo apt-mark hold kubeadm
```

```bash
# RHEL
sudo yum install -y kubeadm-'1.31.x-*' --disableexcludes=kubernetes
kubeadm version
```

```bash
kubeadm version
```

```bash
sudo kubeadm upgrade plan
```

Upgrade control plane

```bash
sudo kubeadm upgrade apply v1.31.x
```

Upgrade worker node

```bash
sudo kubeadm upgrade node
```

## Kubelet and Kubectl

```bash
kubectl drain <node-to-drain> --ignore-daemonsets
```

```bash
apt-cache madison kubelet kubectl
```

```bash
# Debian
sudo apt update
sudo apt-mark unhold kubelet kubectl
# sudo apt install -y kubelet='1.31.x*' kubectl='1.31.x*'
sudo apt install -y kubelet kubectl
sudo apt-mark hold kubelet kubectl
```

```bash
# RHEL
sudo yum install -y kubelet-'1.31.x-*' kubectl-'1.31.x-*' --disableexcludes=kubernetes
```

```bash
sudo systemctl daemon-reload
sudo systemctl restart kubelet
```

```bash
kubectl uncordon <node-to-uncordon>
```
