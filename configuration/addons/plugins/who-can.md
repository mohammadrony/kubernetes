# Who-Can

Check which users or service accounts can perform an action in the cluster.

## Installation

```bash
kubectl krew install who-can
```

## Usage

```bash
kubectl who-can -h
```

Check who can delete pods in a namespace

```bash
kubectl who-can delete pods -n NAMESPACE
```

Check who can create secrets cluster-wide

```bash
kubectl who-can create secrets
```

Check who can access a specific resource

```bash
kubectl who-can get configmap CONFIG_NAME -n NAMESPACE
```
