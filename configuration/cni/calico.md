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
- [github.com](https://raw.githubusercontent.com/projectcalico/calico/v3.28.0/manifests/calico.yaml)

Install calico

```bash
version=3.28.2 # https://github.com/projectcalico/calico/releases
curl -LO https://raw.githubusercontent.com/projectcalico/calico/v$version/manifests/calico.yaml
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
version=3.28.2
curl -LO https://raw.githubusercontent.com/projectcalico/calico/v$version/manifests/tigera-operator.yaml
curl -LO https://raw.githubusercontent.com/projectcalico/calico/v$version/manifests/custom-resources.yaml
```

```bash
kubectl apply -f tigera-operator.yaml
```

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
