# Configmap and Secrets

## Configmap

Get

```bash
kubectl get cm
kubectl get configmap
```

Create

```bash
kubectl create cm CONFIGMAP --from-literal KEY="VALUE" --from-literal KEY2="VALUE2"
```

```bash
kubectl create cm CONFIGMAP --from-literal KEY="VALUE" --from-file FILENAME
```

### Secrets

Get secrets

```bash
kubectl get secrets
```

Decode secrets

```bash
kubectl get secret SECRET -o go-template='{{range $k,$v := .data}}{{"### "}}{{$k}}{{"\n"}}{{$v|base64decode}}{{"\n\n"}}{{end}}'
```

Create generic secret

```bash
kubectl create secret generic SECRET --from-literal KEY="VALUE" --from-literal KEY2="VALUE2"
```

```bash
kubectl create secret generic SECRET --from-literal KEY="VALUE" --from-file FILENAME
```

Create docker registry secret

```bash
kubectl create secret docker-registry SECRET --docker-server DOCKER_REGISTRY_SERVER \
  --docker-username DOCKER_USER --docker-password DOCKER_PASSWORD \
  # --docker-email DOCKER_EMAIL --namespace NAMESPACE
```
