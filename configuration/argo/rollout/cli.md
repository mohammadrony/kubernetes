# CLI

## Installation

```bash
curl -LO https://github.com/argoproj/argo-rollouts/releases/latest/download/kubectl-argo-rollouts-linux-amd64
chmod +x ./kubectl-argo-rollouts-linux-amd64
sudo mv ./kubectl-argo-rollouts-linux-amd64 /usr/local/bin/kubectl-argo-rollouts
```

```bash
kubectl argo rollouts version
```

## Commands

Get rollout and watch progress

```bash
kubectl argo rollouts get rollout <rollout-name> -w
```

Pause rollout

```bash
kubectl argo rollouts pause <rollout-name>
```

Promote rollout

```bash
kubectl argo rollouts promote <rollout-name>
```

Abort rollout

```bash
kubectl argo rollouts abort <rollout-name>
```

Retry rollout

```bash
kubectl argo rollouts retry <rollout-name>
```

### Dashboard

Start UI dashboard

```bash
kubectl argo rollouts dashboard
```

Start UI dashboard on a specific port

```bash
kubectl argo rollouts dashboard --port 3100
```

[Dashboard UI](http://localhost:3100/rollouts)
