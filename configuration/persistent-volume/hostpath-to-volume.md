# Hostpath to Persistent Volume

Pod using Hostpath

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  namespace: default
  labels:
    app: nginx
spec:
  containers:
  - image: nginx
    name: nginx
    volumeMounts:
    - name: app
      mountPath: /usr/share/nginx/html/
  volumes:
  - name: app
    hostPath:
      path: /app/
      type: DirectoryOrCreate
```
