# Install Kubectl

## Snap

```bash
sudo snap install kubectl --classic
```

## Ubuntu

Add kubernetes repository

```bash
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.32/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring-1.32.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring-1.32.gpg] https://pkgs.k8s.io/core:/stable:/v1.32/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes-1.32.list
```

```bash
sudo apt install -y kubectl
sudo apt-mark hold kubectl
```

## RHEL

Add kubernetes repository

```bash
sudo tee -a /etc/yum.repos.d/kubernetes.repo << EOF
[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/v1.32/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/v1.32/rpm/repodata/repomd.xml.key
exclude=kubelet kubeadm kubectl cri-tools kubernetes-cni
EOF
```

```bash
sudo yum install -y kubectl --disableexcludes=kubernetes
```

## Config

Alias

```bash
echo 'alias k="kubectl"' >> ~/.bash_aliases
```

Auto completion

```bash
echo 'source <(kubectl completion bash)' >> ~/.bashrc
# echo 'source <(kubectl completion zsh)' >> ~/.zshrc
```

Reload

```bash
source ~/.bashrc
```
