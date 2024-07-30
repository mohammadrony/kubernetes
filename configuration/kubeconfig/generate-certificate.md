# Generate Certificate

Generate all certificate in `/etc/kubernetes/pki/` directory

- `sudo kubeadm init phase certs all --apiserver-advertise-address <IP>`

Renew apiserver certificate using host address

```bash
sudo rm /etc/kubernetes/pki/apiserver.*
sudo kubeadm init phase certs apiserver --apiserver-cert-extra-sans=<private-or-public-ip>
```
