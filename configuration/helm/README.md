# Helm

## Install Helm

```bash
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
```

Or

```bash
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt install -y apt-transport-https
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt update
sudo apt install -y helm
```

## Add Helm repo

```bash
helm repo add stable https://charts.helm.sh/stable
```

```bash
helm repo add <NAME> <REPOSITORY>
```

Update Helm repository

```bash
helm repo update
```

## Install Chart

```bash
helm search repo <CHART>
```

```bash
helm install <NAME> <CHART> --wait
```

```bash
helm install <NAME> <CHART> --namespace <NAMESPACE> --create-namespace
```

```bash
helm install <NAME> --repo <REPOSITORY> <CHART>
```

```bash
helm install <NAME> --set <VARIABLE>=<VALUE>
```

```bash
helm install <NAME> --values <VALUES.YAML>
```

```bash
helm upgrade --install <NAME> <CHART>
```

```bash
helm test <NAME>
```

## Uninstall Chart

```bash
helm uninstall <NAME>
```
