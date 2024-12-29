# Example

## Application

```bash
kubectl create ns canary-ns
kubectl label namespace canary-ns istio-injection- istio.io/rev=canary
```

```bash
kubectl run --image=nginx -n canary-ns my-canary-nginx
```

```bash
kubectl get pods -n canary-ns
istioctl proxy-status | grep "\.canary-ns "
```

## Bookinfo

```bash
version=$(curl https://api.github.com/repos/istio/istio/releases/latest | jq -r .tag_name)
```

```bash
kubectl apply -f https://raw.githubusercontent.com/istio/istio/$version/samples/bookinfo/platform/kube/bookinfo.yaml
kubectl apply -f https://raw.githubusercontent.com/istio/istio/$version/samples/bookinfo/platform/kube/bookinfo-versions.yaml
```

Gateway

```bash
kubectl apply -f https://raw.githubusercontent.com/istio/istio/$version/samples/bookinfo/networking/bookinfo-gateway.yaml
```
