# Installation

## Prerequisites

Install [istioctl](./istioctl.md)

Analyze cluster

```bash
istioctl analyze
```

## Profile Install

Default profile

```bash
istioctl install
```

Demo profile

```bash
istioctl install --set profile=demo
```

2nd revision

```bash
istioctl install --set revision=canary
```

```bash
kubectl get pods -n istio-system -l app=istiod
kubectl get svc -n istio-system -l app=istiod
kubectl get mutatingwebhookconfigurations
```

## Operator

```bash
kubectl get IstioOperator -n istio-system
```

## Uninstall

```bash
istioctl uninstall --purge
```

```bash
kubectl delete namespace istio-system
```
