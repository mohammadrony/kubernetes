# Chart

## Chart Install

```bash
helm install <name> <chart> --wait
```

```bash
helm install <name> <chart> --namespace <namespace> --create-namespace
```

Install from remote repository

```bash
helm install <name> <repo>/<chart>
```

```bash
helm install <name> --repo <repository> <chart>
```

Install from local files

```bash
helm install <name> ./chart
```

Install with custom values

```bash
helm install <name> --set <variable>=<value>
```

```bash
helm install <name> --values <values.yaml>
```

```bash
helm test <name>
```

## Upgrade

```bash
helm upgrade --install <name> <chart>
```

Rollback deployment if failed upgrade

```bash
helm upgrade --install --atomic <name> <chart>
```

Rollback

```bash
helm rollback <name> <revision>
```

## Uninstall Chart

```bash
helm uninstall <name>
```
