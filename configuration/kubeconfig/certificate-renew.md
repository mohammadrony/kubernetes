# Cluster Certificate Renew

## Renew kube config

```bash
cd /etc/kubernetes/pki/
sudo mv {apiserver.crt,apiserver-etcd-client.key,apiserver-kubelet-client.crt,front-proxy-ca.crt,front-proxy-client.crt,front-proxy-client.key,front-proxy-ca.key,apiserver-kubelet-client.key,apiserver.key,apiserver-etcd-client.crt} ~/
sudo kubeadm init phase certs all --apiserver-advertise-address <IP>
```

```bash
cd /etc/kubernetes/
sudo mv {admin.conf,controller-manager.conf,kubelet.conf,scheduler.conf} ~/
sudo kubeadm init phase kubeconfig all
```

```bash
sudo reboot now
```

```bash
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
```

```bash
sudo kubeadm init phase kubeconfig admin --cert-dir /etc/kubernetes/pki --apiserver-advertise-address <IP>
```

## Multiple master node

```bash
sudo kubeadm init phase certs all --apiserver-advertise-address <PUBLIC IP> --apiserver-cert-extra-sans=<PRIVATE IP1>,<PRIVATE IP2>
```

```bash
cd /etc/kubernetes/pki/
mv {apiserver.crt,apiserver-etcd-client.key,apiserver-kubelet-client.crt,front-proxy-ca.crt,front-proxy-client.crt,front-proxy-client.key,front-proxy-ca.key,apiserver-kubelet-client.key,apiserver.key,apiserver-etcd-client.crt} ~/
cd /etc/kubernetes/
mv {admin.conf,controller-manager.conf,kubelet.conf,scheduler.conf} ~/
```

```bash
rsync /etc/kubernetes/pki/*.crt -e ssh root@node2:/etc/kubernetes/pki/
rsync /etc/kubernetes/pki/*.key -e ssh root@node2:/etc/kubernetes/pki/
rsync /etc/kubernetes/*.conf -e ssh root@node2:/etc/kubernetes/
```

## Renew certificate only

```bash
sudo kubeadm certs renew all
```

```bash
sudo systemctl restart kubelet
```

## Update kubeconfig

```bash
cp ~/.kube/config ~/.kube/$(date --iso)-config
sudo cp /etc/kubernetes/admin.conf ~/.kube/config
sudo chown $USER: ~/.kube/config
```
