# Troubleshoot

Preflight checks and support bundle collection for Kubernetes clusters.

[Docs](https://troubleshoot.sh/docs/)

## Installation

```bash
kubectl krew install preflight
kubectl krew install support-bundle
```

## Support Bundle

### General cluster health - events, node status, pod logs, configs

```bash
kubectl support-bundle https://raw.githubusercontent.com/replicatedhq/troubleshoot-specs/main/in-cluster/default.yaml
```

### Save to a file to share with team or vendor

```bash
kubectl support-bundle --out incident-$(date +%F).tar.gz \
  https://raw.githubusercontent.com/replicatedhq/troubleshoot-specs/main/in-cluster/default.yaml
```

### Weave networking issues

```bash
kubectl support-bundle https://raw.githubusercontent.com/replicatedhq/troubleshoot/main/examples/support-bundle/weave-analyzer.yaml
```

### Collect with built-in analyzers (checks common failure patterns)

```bash
kubectl support-bundle https://raw.githubusercontent.com/replicatedhq/troubleshoot/main/examples/support-bundle/sample-analyzers.yaml
```

## Preflight

### General cluster readiness

```bash
kubectl preflight https://raw.githubusercontent.com/replicatedhq/troubleshoot/main/examples/preflight/sample-preflight.yaml
```

### Node resource requirements (CPU, memory, disk)

```bash
kubectl preflight https://raw.githubusercontent.com/replicatedhq/troubleshoot/main/examples/preflight/node-resources.yaml
```

### PostgreSQL connectivity

```bash
kubectl preflight https://raw.githubusercontent.com/replicatedhq/troubleshoot/main/examples/preflight/postgres.yaml
```

### Redis connectivity

```bash
kubectl preflight https://raw.githubusercontent.com/replicatedhq/troubleshoot/main/examples/preflight/redis.yaml
```
