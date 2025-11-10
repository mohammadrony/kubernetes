# Krew

[Installation guide](https://krew.sigs.k8s.io/docs/user-guide/setup/install/)

## Installation

Linux x86-64 architecture

```sh
version=$(curl https://api.github.com/repos/kubernetes-sigs/krew/releases/latest | jq -r .tag_name)
wget https://github.com/kubernetes-sigs/krew/releases/download/$version/krew-linux_amd64.tar.gz
```

```sh
tar zxvf krew-linux_amd64.tar.gz ./krew-linux_amd64
```

```sh
./krew-linux_amd64 install krew

rm -f krew-linux_amd64*
```

Environment update

```sh
# Update ~/.bashrc and ~/.zshrc file
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
```

```sh
source ~/.bashrc
```

## Other Plugins

[Available kubectl plugins](https://krew.sigs.k8s.io/plugins/)
