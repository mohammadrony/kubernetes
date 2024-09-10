# CoreDNS

Update hosts

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: coredns
  namespace: kube-system
data:
  Corefile: |
    .:53 {
        ...
        ...
        hosts {
          192.168.0.101 example.com www.example.com
          ...
          ...
          fallthrough
        }
        ...
        ...
    }
```

Restart dns pod

```bash
kubectl delete pod -l k8s-app=kube-dns -n kube-system
```
