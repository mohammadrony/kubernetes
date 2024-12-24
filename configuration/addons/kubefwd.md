# Kubefwd

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
