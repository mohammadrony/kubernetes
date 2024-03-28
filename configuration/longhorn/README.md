# Longhorn

## Pre-requisites

### CentOS

```bash
sudo dnf install -y iscsi-initiator-utils
sudo systemctl enable --now iscsid
```

```bash
sudo dnf install -y nfs-utils
sudo dnf install -y epel-release jq
sudo dnf install -y curl util-linux findutils gawk
```

Check NFSv4 support is enabled in kernel

```bash
cat /boot/config-`uname -r`| grep CONFIG_NFS_V4_1
cat /boot/config-`uname -r`| grep CONFIG_NFS_V4_2
```

Optional

```bash
sudo dnf install -y targetcli
sudo targetcli ls
# sudo systemctl enable --now target
```

### Ubuntu

```bash
sudo apt install -y open-iscsi
sudo systemctl enable --now iscsid
```

```bash
sudo apt install -y nfs-common
sudo dnf install -y jq
```

Check NFSv4 support is enabled in kernel

```bash
cat /boot/config-`uname -r`| grep CONFIG_NFS_V4_1
cat /boot/config-`uname -r`| grep CONFIG_NFS_V4_2
```

Optional

```bash
sudo apt install -y targetcli-fb
sudo targetcli ls
# sudo systemctl enable --now target
```

### Validate Environment

[Longhorn repository](https://github.com/longhorn/longhorn)

Master Node

```bash
curl -sSfL https://raw.githubusercontent.com/longhorn/longhorn/v1.6.0/scripts/environment_check.sh | bash
```

## Installation

Chart update

```bash
helm repo add longhorn https://charts.longhorn.io
helm repo update
```

```bash
helm upgrade --install longhorn longhorn/longhorn --create-namespace --namespace longhorn-system
```

```bash
kubectl edit service longhorn-frontend -n longhorn-system
```

```yaml
spec:
  ports:
  - name: http
    nodePort: 30001
    type: NodePort
```
