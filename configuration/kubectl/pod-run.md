# Pod Run

## Templates

Get pod manifest

```bash
kubectl run POD --image=IMAGE -o yaml --dry-run=client > POD.yaml
```

Run pod options

```bash
kubectl run POD --image=IMAGE:TAG
```

```bash
kubectl run POD --image=IMAGE:TAG --port=PORT
```

```bash
kubectl run POD --image=IMAGE:TAG --labels='KEY=VALUE'
```

```bash
kubectl run POD --image=IMAGE:TAG --restart Never
```

## Useful Apps

```bash
kubectl run -it busybox --image=busybox -n default --rm -- sh
```

```bash
kubectl run -it shell --image giantswarm/tiny-tools -n default --rm -- sh
```

Netshoot

```bash
kubectl run -it netshoot --image=nicolaka/netshoot -n default --rm -- sh
```

```bash
kubectl run netshoot --image=nicolaka/netshoot -n default -- sleep infinity
```
