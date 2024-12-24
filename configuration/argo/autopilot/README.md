# Autopilot

## CLI

```bash
version=$(curl https://api.github.com/repos/argoproj-labs/argocd-autopilot/releases/latest | jq -r .tag_name)
curl -Lo - https://github.com/argoproj-labs/argocd-autopilot/releases/download/$version/argocd-autopilot-linux-amd64.tar.gz | tar zx
sudo mv ./argocd-autopilot-linux-amd64 /usr/local/bin/argocd-autopilot
argocd-autopilot version
```
