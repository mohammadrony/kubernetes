# Access Matrix

Show a full RBAC access matrix for resources in a namespace.

## Installation

```bash
kubectl krew install access-matrix
```

## Usage

```bash
kubectl access-matrix -h
```

Show access matrix for the current namespace

```bash
kubectl access-matrix
```

Show access matrix for a specific namespace

```bash
kubectl access-matrix -n NAMESPACE
```

Show access matrix for a specific service account

```bash
kubectl access-matrix --sa NAMESPACE:SERVICE_ACCOUNT
```
