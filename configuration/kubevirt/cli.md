# CLI

## virtctl

Installation

```bash
version=$(curl https://api.github.com/repos/kubevirt/kubevirt/releases/latest | jq -r .tag_name)
# VERSION=$(kubectl get kubevirt.kubevirt.io/kubevirt -n kubevirt -o=jsonpath="{.status.observedKubeVirtVersion}")
ARCH=$(uname -s | tr A-Z a-z)-$(uname -m | sed 's/x86_64/amd64/')
curl -L -o virtctl https://github.com/kubevirt/kubevirt/releases/download/$version/virtctl-$version-$ARCH
chmod +x virtctl
sudo install virtctl /usr/local/bin
```

## kubectl plugin

Installation

```bash
kubectl krew install virt
```
