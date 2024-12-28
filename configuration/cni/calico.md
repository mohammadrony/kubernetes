# Calico CNI

## Installation

Initialize cluster

```bash
control_node=192.168.x.x
cidr=192.168.128.0/17 # 192.168.0.0/16 # calico
sudo kubeadm init --v=5 --cri-socket=unix:///run/containerd/containerd.sock --pod-network-cidr=$cidr \
  --apiserver-advertise-address=$control_node
```

Manifests

- [projectcalico.org](https://docs.projectcalico.org/manifests/calico.yaml)
- [github.com](https://raw.githubusercontent.com/projectcalico/calico/v3.29.1/manifests/calico.yaml)

Install calico

```bash
version=$(curl https://api.github.com/repos/projectcalico/calico/releases/latest | jq -r .tag_name)
curl -LO https://raw.githubusercontent.com/projectcalico/calico/$version/manifests/calico.yaml
```

```bash
kubectl apply -f calico.yaml
```

## Custom Configuration

[Documentation](https://docs.tigera.io/calico/latest/getting-started/kubernetes/quickstart)

Initialize cluster

```bash
control_node=192.168.x.x
cidr=172.16.0.0/16
sudo kubeadm init --v=5 --cri-socket=unix:///run/containerd/containerd.sock --pod-network-cidr=$cidr \
  --apiserver-advertise-address=$control_node
```

Install calico

```bash
version=$(curl https://api.github.com/repos/projectcalico/calico/releases/latest | jq -r .tag_name)
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/$version/manifests/tigera-operator.yaml
```

```bash
curl -O https://raw.githubusercontent.com/projectcalico/calico/$version/manifests/custom-resources.yaml
```

Custom CIDR

```bash
cidr=172.16.0.0
sed -i "s/192.168.0.0/$cidr/" custom-resources.yaml
kubectl apply -f custom-resources.yaml
```

## Troubleshoot

```bash
nmcli connection show
```

*calico-node in `kube-system` or `calico-system` namespace*

```bash
kubectl set env daemonset/calico-node -n kube-system IP_AUTODETECTION_METHOD=interface=<device> # enp0s8 or enp0s3
```

```bash
kubectl get daemonset/calico-node -n kube-system --output json | jq '.spec.template.spec.containers[].env[] | select(.name | startswith("IP"))'
```
