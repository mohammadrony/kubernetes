# Cilium

## Helm Install

```bash
helm repo add cilium https://helm.cilium.io/
helm repo update
helm upgrade --install cilium cilium/cilium --namespace kube-system
```

## Installation

```bash
version=$(curl https://api.github.com/repos/cilium/cilium-cli/releases/latest | jq -r .tag_name)
GOOS=$(go env GOOS)
GOARCH=$(go env GOARCH)
curl -L --remote-name-all https://github.com/cilium/cilium-cli/releases/download/$version/cilium-$GOOS-$GOARCH.tar.gz{,.sha256sum}
sha256sum --check cilium-$GOOS-$GOARCH.tar.gz.sha256sum
sudo tar -C /usr/local/bin -xzvf cilium-$GOOS-$GOARCH.tar.gz
rm -f cilium-$GOOS-$GOARCH.tar.gz{,.sha256sum}
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

Uninstall

```bash
cilium uninstall
```

## Update

```bash
cilium version
```

```bash
cilium upgrade --version v1.x.x
```

### Replace Kube Proxy

```bash
cilium install --set kubeProxyReplacement=true
```

### Ingress Controller

```bash
cilium install --set ingressController.enabled=true
```

### Hubble

```bash
cilium hubble enable
```

```bash
cilium hubble enable --ui
```

Hubble ui

```bash
cilium hubble ui
```

CLI

```bash
version=$(curl https://api.github.com/repos/cilium/hubble/releases/latest | jq -r .tag_name)
HUBBLE_ARCH=amd64
if [ "$(uname -m)" = "aarch64" ]; then HUBBLE_ARCH=arm64; fi
curl -L --remote-name-all https://github.com/cilium/hubble/releases/download/$version/hubble-linux-$HUBBLE_ARCH.tar.gz{,.sha256sum}
sha256sum --check hubble-linux-$HUBBLE_ARCH.tar.gz.sha256sum
sudo tar -C /usr/local/bin -xzvf hubble-linux-$HUBBLE_ARCH.tar.gz
rm hubble-linux-$HUBBLE_ARCH.tar.gz{,.sha256sum}
```

## Connectivity Test

```bash
cilium connectivity test
```
