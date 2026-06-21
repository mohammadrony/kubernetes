# Images

List all container images running across the cluster.

## Installation

```bash
kubectl krew install images
```

## Usage

```bash
kubectl images -h
```

List all images in the current namespace

```bash
kubectl images
```

List all images cluster-wide

```bash
kubectl images -A
```

List images for a specific deployment

```bash
kubectl images -n NAMESPACE -l app=APP_NAME
```
