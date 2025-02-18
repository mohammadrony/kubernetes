# Upgrade Version

## Repository

Debian

```bash
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.32/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring-1.32.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring-1.32.gpg] https://pkgs.k8s.io/core:/stable:/v1.32/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes-1.32.list
```

RHEL

```bash
sudo tee /etc/yum.repos.d/kubernetes-1.32.repo << EOF
[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/v1.32/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/v1.32/rpm/repodata/repomd.xml.key
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
# sudo apt install -y kubeadm='1.32.x*'
sudo apt-mark hold kubeadm
```

```bash
# RHEL
sudo yum install -y kubeadm-'1.32.x-*' --disableexcludes=kubernetes
kubeadm version
```

```bash
kubeadm version
```

Upgrade control plane

```bash
sudo kubeadm upgrade plan
```

```bash
sudo kubeadm upgrade apply v1.32.x
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
# sudo apt install -y kubelet='1.32.x*' kubectl='1.32.x*'
sudo apt install -y kubelet kubectl
sudo apt-mark hold kubelet kubectl
```

```bash
# RHEL
sudo yum install -y kubelet-'1.32.x-*' kubectl-'1.32.x-*' --disableexcludes=kubernetes
```

```bash
sudo systemctl daemon-reload
sudo systemctl restart kubelet
```

```bash
kubectl uncordon <node-to-uncordon>
```
