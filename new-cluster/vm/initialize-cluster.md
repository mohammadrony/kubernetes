# Initialize Cluster

## Control Plane

Cluster initialize

```bash
control_node=192.168.56.2
cidr=192.168.128.0/17 # 192.168.0.0/16 # calico
sudo kubeadm init --pod-network-cidr=$cidr --apiserver-advertise-address=$control_node --v=5
```

Copy kubeconfig

```bash
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

## Multiple Control Plane

Load balancer

```bash
sudo apt install -y haproxy
sudo systemctl enable haproxy
```

```bash
sh haproxy.sh
```

```bash
sudo systemctl restart haproxy
```

Cluster initialize

```bash
cidr=192.168.128.0/17 # 192.168.0.0/16 # calico
control_plane_ip="192.168.56.2"
load_balancer="192.168.56.101"
control_plane_endpoint="${load_balancer}:6443"

sudo kubeadm init --control-plane-endpoint $control_plane_endpoint --pod-network-cidr=$cidr --upload-certs
```

Copy kubeconfig

```bash
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

## Install CNI

Calico

```bash
version=$(curl https://api.github.com/repos/projectcalico/calico/releases/latest | jq -r .tag_name)
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/$version/manifests/calico.yaml
# kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml
```

## Join Control Plane

Get command

```bash
kubeadm token create --print-join-command
```

Get certificate key

```bash
kubeadm init phase upload-certs --upload-certs
```

Join cluster

```bash
sudo kubeadm join 192.168.56.101:6443 --token xxxx.xxxx --discovery-token-ca-cert-hash sha256:xxxx \
  --control-plane --certificate-key xxxxxxxx
```

Update load balancer

```bash
sudo sed -i '/master2/s/#//' /etc/haproxy/haproxy.cfg
sudo systemctl restart haproxy
```

## Join Worker Node

Get command

```bash
kubeadm token create --print-join-command
```

Join cluster

```bash
sudo kubeadm join 192.168.56.101:6443 --token xxxx.xxxx --discovery-token-ca-cert-hash sha256:xxxx
```

Update worker node label

```bash
NODE=worker
kubectl label node $NODE node-role.kubernetes.io/worker=
```
