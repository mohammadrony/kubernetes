# Calico CNI

## Installation

- [Github - projectcalico/calico](https://github.com/projectcalico/calico/)
- [Calico - manifest](https://docs.projectcalico.org/manifests/calico.yaml)
- [Install Calico](https://docs.tigera.io/calico/latest/getting-started/)

### Tigera Operator

[Documentation](https://docs.tigera.io/calico/latest/getting-started/kubernetes/quickstart)

Initialize cluster

```bash
control_node=10.x.x.x
cidr=192.168.0.0/16 # default
sudo kubeadm init --pod-network-cidr=$cidr --apiserver-advertise-address=$control_node --v=5
```

Install calico

```bash
version=$(curl https://api.github.com/repos/projectcalico/calico/releases/latest | jq -r .tag_name)
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/$version/manifests/tigera-operator.yaml
```

```bash
curl -O https://raw.githubusercontent.com/projectcalico/calico/$version/manifests/custom-resources.yaml
```

Custom CIDR

```bash
cidr=192.168.0.0/16 # default
sed -i "s/192.168.0.0/$cidr/" custom-resources.yaml
kubectl apply -f custom-resources.yaml
```

Check CIDR

```bash
kubectl get installations.operator.tigera.io default \
  -o jsonpath='{.spec.calicoNetwork.ipPools[*].cidr}{"\n"}'
```

### Calico Manifest

Initialize cluster

```bash
control_node=10.x.x.x
cidr=192.168.0.0/16 # default
sudo kubeadm init --pod-network-cidr=$cidr --apiserver-advertise-address=$control_node --v=5
```

Download manifest

```bash
version=$(curl https://api.github.com/repos/projectcalico/calico/releases/latest | jq -r .tag_name)
curl -O https://raw.githubusercontent.com/projectcalico/calico/$version/manifests/calico.yaml
```

CIDR

```bash
cidr=192.168.0.0/16 # default
sed -i "s/# \(.*CALICO_IPV4POOL_CIDR\)/\1/" calico.yaml
sed -i "s/# \(.*\)192.168.0.0/\1$cidr/" calico.yaml
grep -A1 "CALICO_IPV4POOL_CIDR" calico.yaml
```

Apply manifest

```bash
kubectl apply -f calico.yaml
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
