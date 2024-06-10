# Admin Role Creation

## Create account and role

```bash
kubectl create token admin-token
```

```bash
kubectl apply -f 1-sa-cr-crb.yaml
```

```bash
kubectl patch serviceaccount admin-sa --namespace=default -p '{"secrets": [{"name": "admin-secret"}]}'
```

```bash
kubectl apply -f 2-secret.yaml
```

## Create dedicated kubeconfig

Create current kubeconfig file

```bash
kubectl config view --flatten --minify > kubeconfig.tmp
```

Set context to use token user and namespace

```bash
CLUSTER=CLUSTER-1
kubectl config --kubeconfig kubeconfig.tmp set-credentials admin-user --token admin-token
kubectl config --kubeconfig kubeconfig.tmp set-context ${CLUSTER} --user admin-user
kubectl config --kubeconfig kubeconfig.tmp set-context ${CLUSTER} --namespace default
```

Save new config

```bash
kubectl config --kubeconfig kubeconfig.tmp view --flatten --minify > ~/config
```

```bash
rm kubeconfig.tmp
```
