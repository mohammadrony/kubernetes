# Ubuntu Node Configuration

Update ackage

```bash
sudo apt update
```

Install some common package

```bash
sudo apt install -y vim net-tools nmap telnet
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

Enable IP forwarding

```bash
sudo tee -a /etc/sysctl.conf << EOF
net.ipv4.ip_forward = 1
EOF
sudo sysctl -p
```

Setup docker dependency

```bash
sudo apt install -y curl gnupg2 software-properties-common apt-transport-https ca-certificates
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

Install containerd

```bash
sudo apt update
sudo apt install -y containerd.io
sudo apt-mark hold containerd.io
```

Update default config

```bash
sudo mkdir -p /etc/containerd
containerd config default | sudo tee /etc/containerd/config.toml
sudo sed -i 's/\(SystemdCgroup = \).*/\1true/' /etc/containerd/config.toml
sudo systemctl enable --now containerd
```

Containerd config setup

```bash
sudo tee /etc/crictl.yaml << EOF
runtime-endpoint: unix:///run/containerd/containerd.sock
image-endpoint: unix:///run/containerd/containerd.sock
EOF
sudo systemctl restart containerd
sudo crictl config --list
```

Disable firewall

```bash
sudo systemctl disable --now ufw
```

Disable apparmor

```bash
sudo systemctl disable --now apparmor
sudo systemctl restart containerd
```

Load kernal modules

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

Add kubernetes repository

```bash
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.34/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring-1.34.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring-1.34.gpg] https://pkgs.k8s.io/core:/stable:/v1.34/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes-1.34.list
```

Install kubeadm kubelet

```bash
sudo apt update
sudo apt install -y kubeadm kubelet
sudo apt-mark hold kubeadm kubelet
```

Install kubectl

```bash
sudo apt install -y kubectl
sudo apt-mark hold kubectl
```

Start kubelet

```bash
sudo systemctl enable --now kubelet
sudo systemctl status kubelet
```
