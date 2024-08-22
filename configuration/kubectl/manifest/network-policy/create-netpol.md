# Create Network Policy

Deny All Traffic

```bash
kubectl apply -f 1-deny-all-traffic.yaml
```

Allow All Traffic

```bash
kubectl apply -f 2-allow-all-traffic.yaml
```

Allow Pod to Pod

```bash
kubectl apply -f 3-allow-pod-to-pod.yaml
```

Allow Pod to Namespace

```bash
kubectl apply -f 4-allow-pod-to-ns.yaml
```

Allow Namespace to Namespace

```bash
kubectl apply -f 5-allow-ns-to-ns.yaml
```

Allow IP Block

```bash
kubectl apply -f 6-allow-ipblock.yaml
```

Allow Multi Selector

```bash
kubectl apply -f 7-allow-multi-selector.yaml
```

Allow Port Range

```bash
kubectl apply -f 8-allow-port-range.yaml
```
