# Longhorn

## Pre-requisites

CentOS

```bash
sudo dnf install -y iscsi-initiator-utils
sudo systemctl enable --now iscsid
```

```bash
sudo dnf install -y targetcli
sudo targetcli ls
sudo systemctl enable --now target
```

Ubuntu

```bash
sudo apt install -y open-iscsi
sudo systemctl enable --now iscsid
```

```bash
sudo apt install -y targetcli-fb
sudo targetcli ls
sudo systemctl enable --now target
```

## Installation

Chart update

```bash
helm repo add longhorn https://charts.longhorn.io
helm repo update
```

```bash
kubectl create namespace longhorn-system
helm install longhorn longhorn/longhorn --namespace longhorn-system
```
