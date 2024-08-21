# Kubernetes Dashbaord

## Installation

```bash
helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
helm repo update
```

```bash
helm upgrade --install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard --namespace kubernetes-dashboard --create-namespace
```

## Create dashboard user

Create admin user account

```bash
kubectl apply -f cluster-admin-user.yaml
kubectl apply -f cluster-readonly-user.yaml
```

Create read-only user account

```bash
kubectl apply -f ns-admin-user.yaml
kubectl apply -f ns-readonly-user.yaml
```

Update service account secret

```bash
kubectl patch serviceaccount cluster-admin-sa -n kubernetes-dashboard -p '{"secrets": [{"name": "cluster-admin-secret"}]}'
kubectl patch serviceaccount cluster-read-only-sa -n kubernetes-dashboard -p '{"secrets": [{"name": "cluster-read-only-secret"}]}'
```

```bash
kubectl patch serviceaccount default-admin-sa -n default -p '{"secrets": [{"name": "default-admin-secret"}]}'
kubectl patch serviceaccount default-read-only-sa -n default -p '{"secrets": [{"name": "default-read-only-secret"}]}'
```

Get service accounts

```bash
kubectl get serviceaccounts
```

Get service account token from secret

```bash
kubectl get secret cluster-admin-secret -n kubernetes-dashboard -o yaml | yq .data.token | base64 -d && echo
kubectl get secret cluster-read-only-secret -n kubernetes-dashboard -o yaml | yq .data.token | base64 -d && echo
```

```bash
kubectl get secret default-admin-secret -n default -o yaml | yq .data.token | base64 -d && echo
kubectl get secret default-read-only-secret -n default -o yaml | yq .data.token | base64 -d && echo
```

Generate new token

```bash
kubectl create token cluster-admin-sa -n kubernetes-dashboard
kubectl create token cluster-read-only-sa -n kubernetes-dashboard
```

```bash
kubectl create token default-admin-sa -n default
kubectl create token default-read-only-sa -n default
```

## Expose service

Proxy service

```bash
kubectl proxy --port=8001
```

Open [kubernetes-dashboard](http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard-kong-proxy:443/proxy/#/login) link in browser.

Domain setup

- Save [dashboard.conf](./dashboard.example.com.conf) file in `/etc/nginx/sites-available/` and link it to `/etc/nginx/sites-enabled/` directory.

- Create SSL certificate

   ```bash
   sudo certbot --nginx -d dashboard.example.com
   ```

- Expose dashboard ingress

   ```bash
   kubectl apply -f ingress.yaml
   ```

- Open dashboard url [dashboard.example.com](https://dashboard.example.com) from browser.
