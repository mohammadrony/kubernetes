# Outdated

Find pods running outdated container image versions.

## Installation

```bash
kubectl krew install outdated
```

## Usage

```bash
kubectl outdated -h
```

Check for outdated images in the current namespace

```bash
kubectl outdated
```

Check a specific namespace

```bash
kubectl outdated -n NAMESPACE
```

Exclude namespaces from the check

```bash
kubectl outdated --ignore-ns kube-system --ignore-ns monitoring
```
