# CLI

```bash
version=$(curl https://api.github.com/repos/argoproj/argo-workflows/releases/latest | jq -r .tag_name)
curl -sLO https://github.com/argoproj/argo-workflows/releases/download/$version/argo-linux-amd64.gz
gunzip argo-linux-amd64.gz
chmod +x argo-linux-amd64
sudo mv ./argo-linux-amd64 /usr/local/bin/argo
```

```bash
argo list -n argo
```
