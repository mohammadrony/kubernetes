# Cluster Issues

## Node NotReady

Disable apparmor

```bash
sudo systemctl disable --now apparmor
sudo systemctl restart containerd
```
