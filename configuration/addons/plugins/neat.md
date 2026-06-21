# Neat

Clean up `kubectl get -o yaml` output by removing managed fields, status noise, and default values.

## Installation

```bash
kubectl krew install neat
```

## Usage

```bash
kubectl neat -h
```

Clean up a deployment manifest

```bash
kubectl get deployment DEPLOYMENT -n NAMESPACE -o yaml | kubectl neat
```

Clean up any resource

```bash
kubectl get RESOURCE NAME -o yaml | kubectl neat
```

Save a clean manifest to file

```bash
kubectl get deployment DEPLOYMENT -o yaml | kubectl neat > deployment.yaml
```
