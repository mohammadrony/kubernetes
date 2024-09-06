# WeaveNet

## Installation

Initialize cluster with respect to weavenet

```bash
sudo kubeadm init --pod-network-cidr=10.32.0.0/12 --apiserver-advertise-address=192.168.x.x
```

[Releases](https://github.com/weaveworks/weave/releases)

```bash
version=2.8.1
curl -LO https://github.com/weaveworks/weave/releases/download/v$version/weave-daemonset-k8s.yaml
kubectl apply -f weave-daemonset-k8s.yaml
```
