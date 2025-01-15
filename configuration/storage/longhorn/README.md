# Longhorn

## Prerequisites

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
sudo apt install -y jq
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
version=$(curl https://api.github.com/repos/longhorn/longhorn/releases/latest | jq -r .tag_name)
curl https://raw.githubusercontent.com/longhorn/longhorn/$version/scripts/environment_check.sh -o install.sh

bash install.sh
rm -f install.sh
```

## Installation

### YAML install

```bash
kubectl apply -f https://raw.githubusercontent.com/longhorn/longhorn/master/deploy/longhorn.yaml
```

### Helm Chart

Add chart repo

```bash
helm repo add longhorn https://charts.longhorn.io
helm repo update
```

```bash
helm upgrade --install longhorn longhorn/longhorn --create-namespace --namespace longhorn-system
```

Custom configuration

```bash
helm show values longhorn/longhorn > values.longhorn.yaml
```

```bash
helm upgrade --install longhorn longhorn/longhorn --create-namespace --namespace longhorn-system --values values.longhorn.yaml
```

Update ui service port

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
