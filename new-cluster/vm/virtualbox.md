# Vagrant with Virtualbox

## Start VM

```bash
vagrant up
```

Login to VM

```bash
vagrant ssh # kube-control-1 kube-worker-1 kube-worker-2
```

```bash
sshpass -p 'vagrant' ssh vagrant@192.168.56.111 # 112 113
```

## Cleanup

Stop VM

```bash
vagrant halt
```

Delete VM

```bash
vagrant destroy
```
