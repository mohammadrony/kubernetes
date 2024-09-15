# ConfigMap to Persistent Volume

Configmap

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: index-config
  namespace: default
data:
  index.html: |
    Hello World.
    Thanks for visiting.
```

Pod using Configmap

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
    - mountPath: /usr/share/nginx/html/index.html
      name: data
      subPath: index
  volumes:
  - name: data
    configMap:
      name: index-config
      items:
      - key: index.html
        path: index
```
