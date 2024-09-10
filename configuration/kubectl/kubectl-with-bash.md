# Kubectl with Bash

Delete terminating namespace

```bash
NAMESPACE=<namespace>

kubectl get namespace $NAMESPACE -o json \
  | tr -d "\n" | sed "s/\"finalizers\": \[[^]]\+\]/\"finalizers\": []/" \
  | kubectl replace --raw /api/v1/namespaces/$NAMESPACE/finalize -f -
```

Restart all deployments

```bash
kubectl get deploy | awk '{print $1}' | grep -v NAME | xargs -I "{}" kubectl rollout restart deploy {}
```
