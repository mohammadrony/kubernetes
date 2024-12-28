# Merge Config File

Config backup

```bash
cp ~/.kube/config ~/.kube/config.bak
```

Merge config

```bash
export KUBECONFIG=~/.kube/config:~/.kube/config-2
```

```bash
kubectl config view --flatten > config
```

Save changes

```bash
mv config ~/.kube/config
chmod 600 ~/.kube/config
```

Update kubeconfig variable

```bash
export KUBECONFIG=~/.kube/config
```

Get clusters

```bash
kubectl config get-clusters
```
