# WeaveNet

## Installation

Initialize cluster with respect to weavenet

```bash
sudo kubeadm init --pod-network-cidr=10.32.0.0/12 --apiserver-advertise-address=192.168.x.x
```

YAML install

```bash
version=$(curl https://api.github.com/repos/weaveworks/weave/releases/latest | jq -r .tag_name)
curl -LO https://github.com/weaveworks/weave/releases/download/v$version/weave-daemonset-k8s.yaml
kubectl apply -f weave-daemonset-k8s.yaml
```
