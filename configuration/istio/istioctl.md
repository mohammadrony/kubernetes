# istioctl

Installation

```bash
curl -L https://istio.io/downloadIstio -o install.sh

sh install.sh
rm -f install.sh
```

```bash
sudo mv istio-*/bin/istioctl /usr/local/bin
```

Auto completion

```bash
mkdir ~/.auto-completion
cp istio-*/tools/_istioctl ~/.auto-completion
```

```bash
# Update ~/.zshrc and ~/.bashrc
source ~/.auto-completion/_istioctl
```

Checking cluster

```bash
istioctl x precheck
```
