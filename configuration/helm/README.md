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
helm repo add <name> <repository>
```

Update Helm repository

```bash
helm repo update
```

## Find repository

```bash
helm search repo
```

```bash
helm search repo <chart>
```

```bash
helm search repo -l <chart>
```

## Install Chart

```bash
helm install <name> <chart> --wait
```

```bash
helm install <name> <chart> --namespace <namespace> --create-namespace
```

```bash
helm install <name> --repo <repository> <chart>
```

```bash
helm install <name> --set <variable>=<value>
```

```bash
helm install <name> --values <values.yaml>
```

```bash
helm upgrade --install <name> <chart>
```

```bash
helm test <name>
```

## Uninstall Chart

```bash
helm uninstall <name>
```
