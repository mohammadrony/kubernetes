# Minikube

## Installation

[Get Started](https://minikube.sigs.k8s.io/docs/start)

```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm -f minikube-linux-amd64
```

Alias setup

```bash
echo 'alias mk="minikube"' >> ~/.bash_aliases
source ~/.bashrc
```

Start cluster

```bash
minikube start
```

```bash
minikube start --memory=8g --cpus=4 --kubernetes-version=v1.32
```

Status

```bash
minikube status
```

## Commands

```bash
minikube
```

Kubectl

```bash
minikube kubectl get pods -A
```

Addons

```bash
minikube addons list
```
