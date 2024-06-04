# Kubectl with Bash

Restart all deployments

```bash
kubectl get deploy | awk '{print $1}' | grep -v NAME | xargs -I "{}" kubectl rollout restart deploy {}
```
