# Google cadvisor

[cadvisor](https://github.com/google/cadvisor)

## Deploy cadvisor

Pick a version from [here](https://github.com/google/cadvisor/releases).

```bash
VERSION=v0.48.1
```

```bash
kustomize build "https://github.com/google/cadvisor/deploy/kubernetes/base?ref=${VERSION}" | kubectl apply -f -
```
