# WeaveNet

## Installation

Initialize cluster with respect to weavenet

```bash
sudo kubeadm init --pod-network-cidr=10.32.0.0/12 --apiserver-advertise-address=192.168.x.x
```

YAML install

```bash
version=$(curl https://api.github.com/repos/weaveworks/weave/releases/latest | jq -r .tag_name)
kubectl apply -f https://github.com/weaveworks/weave/releases/download/$version/weave-daemonset-k8s.yaml
```
