# Useful Commands

Alias

```bash
alias k='kubectl'
alias kns='kubens'
alias ktx='kubectx'
```

Packages

```bash
sudo apt install -y fzf most
```

```bash
sudo snap install kubectx --classic
```

```bash
sudo snap install k9s
sudo ln -s /snap/k9s/current/bin/k9s /snap/bin/
```

Autocompletion

```zsh
# Zsh
source <(kubectl completion zsh)
```

```bash
# Bash
source <(kubectl completion bash)
```

Convert run and create command to yaml

```bash
kubectl run POD --image=IMAGE:TAG --dry-run=client -o yaml > file.yaml
```

Or

```bash
export do="--dry-run=client -o yaml"
```

```bash
kubectl run POD --image=IMAGE:TAG $do > file.yaml
```
