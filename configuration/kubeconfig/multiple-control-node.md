# Multiple Control Node

Save secret files copy from following directories:

- `/etc/kubernetes/pki/`
- `/etc/kubernetes/`

Generate certs to use multiple control node

```bash
sudo kubeadm init phase certs all --apiserver-advertise-address <PUBLIC IP> --apiserver-cert-extra-sans=<PRIVATE IP1>,<PRIVATE IP2>
```

Copy secrets to other control node

```bash
rsync /etc/kubernetes/pki/*.crt -e ssh root@node2:/etc/kubernetes/pki/
rsync /etc/kubernetes/pki/*.key -e ssh root@node2:/etc/kubernetes/pki/
rsync /etc/kubernetes/*.conf -e ssh root@node2:/etc/kubernetes/
```
