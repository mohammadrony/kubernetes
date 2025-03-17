# DirectPV

Install plugin

```bash
kubectl krew install directpv
```

Install directpv in cluster

```bash
kubectl directpv install
```

Get information

```bash
kubectl directpv info
```

Discover drives and write in `drives.yaml` file

```bash
kubectl directpv discover
```

Initialize drives

```bash
kubectl directpv init drives.yaml

# kubectl directpv init drives.yaml --dangerous
```

List drives

```bash
kubectl directpv list drives
```
