# df-pv

Show disk usage for PersistentVolumes, like `df` but for PVs.

## Installation

```bash
kubectl krew install df-pv
```

## Usage

```bash
kubectl df-pv -h
```

Show disk usage for all PVs cluster-wide

```bash
kubectl df-pv
```

Filter by namespace

```bash
kubectl df-pv -n NAMESPACE
```
