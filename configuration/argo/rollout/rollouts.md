# Rollouts

Apply rollout with `nginx:1.24-alpine` image

```bash
kubectl apply -f nginx-rollout.yaml
```

Apply rollout with `nginx:latest` image

```bash
kubectl apply -f nginx-rollout.yaml
```

Visualize the rollout

```bash
kubectl argo rollouts get rollout nginx-rollout --watch
```

Immediately shift to new version

```bash
kubectl argo rollouts promote nginx-rollout
```

Abort rollout and use old version

```bash
kubectl argo rollouts abort nginx-rollout
```

## Dashboard

```bash
kubectl argo rollouts dashboard
```

[Dashboard UI](http://localhost:3100/rollouts)
