# Krew

## Installation

[Installation guide](https://krew.sigs.k8s.io/docs/user-guide/setup/install/)

[Available version](https://github.com/kubernetes-sigs/krew/releases)

```bash
version=$(curl https://api.github.com/repos/kubernetes-sigs/krew/releases/latest | jq -r .tag_name)
wget https://github.com/kubernetes-sigs/krew/releases/download/$version/krew-linux_amd64.tar.gz
```

```bash
tar zxvf krew-linux_amd64.tar.gz
```

```bash
./krew-linux_amd64 install krew
```

Environment update

```bash
Update ~/.bashrc and ~/.zshrc file
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
```

## Other Plugins

[Available kubectl plugins](https://krew.sigs.k8s.io/plugins/)
