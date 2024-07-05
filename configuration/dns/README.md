# DNS

- [Debugging DNS Resolution](https://kubernetes.io/docs/tasks/administer-cluster/dns-debugging-resolution/)

## Cluster Environment Test

Create DNS utils pod

```bash
kubectl apply -f https://k8s.io/examples/admin/dns/dnsutils.yaml
```

```bash
kubectl -n default get pods dnsutils
```

```bash
kubectl -n default exec dnsutils -- nslookup kubernetes.default
```

Check local DNS configuration

```bash
kubectl -n default exec dnsutils -- cat /etc/resolv.conf
```

## Add Custom Host Address

```bash
kubectl -n kube-system edit configmap/coredns
```

```yaml
apiVersion: v1
data:
  Corefile: |
    .:53 {
        ...
        ...
        hosts {
          192.168.0.101 example.com www.example.com
          fallthrough
        }
    }
kind: ConfigMap
```

```bash
kubectl -n kube-system rollout restart deploy coredns
```

```bash
kubectl apply -f https://k8s.io/examples/admin/dns/dnsutils.yaml
kubectl -n default exec dnsutils -- nslookup www.example.com
```
