# istioctl

## Setup

Installation

```bash
curl -L https://istio.io/downloadIstio | sh -
```

```bash
sudo mv istio-*/bin/istioctl /usr/local/bin
```

Auto completion

```bash
cp istio-*/tools/_istioctl ~/.auto-completion
```

```bash
source ~/.auto-completion/_istioctl
```

## Istio Install

```bash
istioctl install
```

## Uninstall

```bash
istioctl uninstall --purge
```

```bash
kubectl delete namespace istio-system
```
