# Merge Kubeconfig

Config backup

```bash
cp ~/.kube/config ~/.kube/config.bak
```

Merge config

```bash
export KUBECONFIG=~/.kube/config:./path/config
```

```bash
kubectl config view --flatten > config
```

Save changes

```bash
mv config ~/.kube/config
```

```bash
kubectl config get-clusters
```
