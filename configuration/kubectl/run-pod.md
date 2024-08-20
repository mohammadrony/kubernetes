# Run Pod

## Templates

Get pod manifest

```bash
kubectl run POD --image=IMAGE -o yaml --dry-run=client > POD.yaml
```

Run pod

```bash
kubectl run POD --image=IMAGE:TAG
kubectl run POD --image=IMAGE:TAG --port=PORT
```

## Useful Apps

```bash
kubectl run -it busybox --image=busybox --rm -- sh
kubectl run -it shell --image giantswarm/tiny-tools --restart Never --rm -- sh
```
