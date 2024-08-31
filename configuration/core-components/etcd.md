# ETCD Management

## Install etcdctl

```bash
git clone https://github.com/etcd-io/etcd.git
```

```bash
cd etcd/etcdctl
go build .
```

```bash
sudo mv etcdctl /usr/local/bin/
```

## Usage

```bash
etcdctl -h
```

## Snapshot

```bash
ETCDCTL_API=3 etcdctl --endpoints https://127.0.0.1:2379 snapshot save snapshot.db
```

Verify snapshot

```bash
etcdutl --write-out=table snapshot status snapshot.db
```

Backup certificate

```bash
sudo tar -zcvf etcd.tar.gz /etc/kubernetes/pki/etcd
```

Drain nodes before restore

```bash
kubectl drain NODE --ignore-daemonsets
```

Restore database

```bash
rm -rf /var/lib/etcd

ETCDCTL_API=3 etcdctl snapshot restore snapshot.db --name=KUBE-MASTER --data-dir=/var/lib/etcd --endpoints=https://127.0.0.1:2379 \
  --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key
```
