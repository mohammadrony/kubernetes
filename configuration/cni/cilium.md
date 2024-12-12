# Cilium

Installation

```bash
version=$(curl https://api.github.com/repos/cilium/cilium-cli/releases/latest | jq -r .tag_name)
GOOS=$(go env GOOS)
GOARCH=$(go env GOARCH)
curl -L --remote-name-all https://github.com/cilium/cilium-cli/releases/download/$version/cilium-${GOOS}-${GOARCH}.tar.gz{,.sha256sum}
sha256sum --check cilium-${GOOS}-${GOARCH}.tar.gz.sha256sum
sudo tar -C /usr/local/bin -xzvf cilium-${GOOS}-${GOARCH}.tar.gz
rm cilium-${GOOS}-${GOARCH}.tar.gz{,.sha256sum}
```

```bash
sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=192.168.x.x
```

```bash
cilium install
```

```bash
cilium status --wait
kubectl get pods -n kube-system
```

```bash
cilium hubble enable
```
