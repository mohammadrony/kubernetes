# Role and Role Binding

## Use case

- Role and Role Binding is namespaced permission.
- Cluster Role and Cluster Role Binding is cluster wide permission.
- Cluster Role and Role Binding can be used together.

## Create account and role

```bash
kubectl apply -f 1-sa.yaml
```

```bash
kubectl apply -f 2-secret.yaml
```

```bash
kubectl apply -f 3-cr-crb.yaml
```

```bash
kubectl apply -f 4-role-rolebinding.yaml
```

```bash
kubectl patch serviceaccount admin-sa -n default -p '{"secrets": [{"name": "admin-secret"}]}'
kubectl patch serviceaccount developer-sa -n default -p '{"secrets": [{"name": "developer-secret"}]}'
```

Get secret token

```bash
kubectl get secret admin-secret -o yaml | yq .data.token | base64 -d && echo
kubectl get secret developer-secret -o yaml | yq .data.token | base64 -d && echo
```

Generate token

```bash
kubectl create token admin-sa -n default
kubectl create token developer-sa -n default
```

## Create dedicated kubeconfig

Save current kubeconfig

```bash
kubectl config view --flatten --minify > config.tmp
```

Create users kubeconfig

```bash
CLUSTER=$(kubectl config current-context)
```

```bash
kubectl --kubeconfig config.tmp config set-context ${CLUSTER} --namespace default

kubectl --kubeconfig config.tmp config set-credentials developer-sa --token $(kubectl create token developer-sa -n default)
kubectl --kubeconfig config.tmp config set-context ${CLUSTER} --user developer-sa
kubectl --kubeconfig config.tmp config view --flatten --minify > developer-config

kubectl --kubeconfig config.tmp config set-credentials admin-sa --token $(kubectl create token admin-sa -n default)
kubectl --kubeconfig config.tmp config set-context ${CLUSTER} --user admin-sa
kubectl --kubeconfig config.tmp config view --flatten --minify > admin-config
```

Config file reset

```bash
KUBECONFIG=~/.kube/config
rm config.tmp
```
