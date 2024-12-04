# MicroK8s

[MicroK8s documentation](https://microk8s.io/docs)

## Installation

```bash
sudo snap install microk8s --classic
```

Alias setup

```bash
echo 'alias mk="microk8s kubectl"' >> ~/.bash_aliases
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

Status

```bash
microk8s status
# microk8s status --wait-ready
```

## Commands

Enable services

```bash
microk8s enable --help
```

```bash
microk8s enable dashboard
microk8s enable dns
microk8s enable registry
microk8s enable istio
```

kubectl commands

```bash
mk get all --all-namespaces
# microk8s kubectl get all --all-namespaces
```

Access dashboard

```bash
microk8s dashboard-proxy
```

## Uninstall

Disable services

```bash
microk8s disable --help
```

```bash
microk8s disable dashboard
microk8s disable dns
microk8s disable registry
microk8s disable istio
```

Uninstall microk8s

```bash
sudo snap remove microk8s
```
