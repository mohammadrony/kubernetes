# Add-ons

## Kubectl Plugins

- [Krew](./plugins/krew.md)
- [Ksniff](./plugins/ksniff.md)
- [View ServiceAccount Kubeconfig](./plugins/view-sa-kubeconfig.md)

## Kubectx and Kubens

```bash
sudo snap install kubectx --classic
```

Switch context

```bash
kubectx ctx_name
```

Switch namespace

```bash
kubens ns_name
```

## K9s

Snap

```bash
sudo snap install k9s
sudo ln -s /snap/k9s/current/bin/k9s /snap/bin/
```

Source

```bash
curl -sS https://webi.sh/k9s | bash
```

Usage

```bash
k9s
```

```bash
k9s -n namespace
k9s --context cluster
```

```bash
k9s --readonly
```

## Kubefwd

```bash
mkdir -p ~/go/src/github.com/txn2/
```

```bash
git clone https://github.com/txn2/kubefwd.git ~/go/src/github.com/txn2/kubefwd
```

```bash
cd ~/go/src/github.com/txn2/kubefwd
git checkout 1.4.10
```

```bash
GOBIN=~/bin go install ./cmd/kubefwd/kubefwd.go
```

```bash
cd ~
rm ./go -rf
```

```bash
sudo mv ~/bin/kubefwd /usr/local/bin/
```

```bash
kubefwd
```
