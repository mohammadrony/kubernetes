# MicroK8s

[MicroK8s documentation](https://microk8s.io/docs)

## Installation

Minimal kubernetes cluster

```bash
sudo snap install microk8s --classic
```

Alias setup

```bash
echo 'alias mk="microk8s"' >> ~/.bash_aliases
source ~/.bashrc
```

User setup

```bash
sudo groupadd microk8s
sudo usermod -a -G microk8s $USER
```

Reload

```bash
newgrp microk8s
# sudo reboot
```

Kubeconfig

```bash
microk8s config > ~/.kube/microk8s-config
```

Status

```bash
microk8s status
# microk8s status --wait-ready
```

Start service

```bash
microk8s start
```

## Commands

kubectl commands

```bash
microk8s kubectl get all -A
```

```bash
kubectl get all -A --kubeconfig="$HOME/.kube/microk8s-config"
```

Enable services

```bash
microk8s enable --help
```

Addons

```bash
microk8s enable dns
microk8s enable ingress
microk8s enable dashboard
microk8s enable community
microk8s enable registry
microk8s enable istio
```

Disable services

```bash
microk8s disable --help
```

```bash
microk8s disable dns
microk8s disable ingress
microk8s disable dashboard
microk8s disable community
microk8s disable registry
microk8s disable istio
```

Access dashboard

```bash
microk8s dashboard-proxy
```

## Uninstall

Disable addons

```bash
sudo microk8s reset
```

Stop service

```bash
microk8s stop
```

Uninstall microk8s

```bash
sudo snap remove microk8s
```
