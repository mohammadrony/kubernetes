# Tail

## Installation

```bash
kubectl krew install tail
```

## Usage

Help page

```bash
kubectl tail -h
```

Logs by pod name

```bash
kubectl tail -p POD
```

Pods by label selector

```bash
kubectl tail -l KEY=VALUE
```

Pods in deployment

```bash
kubectl tail -d DEPLOYMENT
```
