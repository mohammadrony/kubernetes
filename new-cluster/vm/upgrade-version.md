# Upgrade Version

## Repository

```bash
sudo tee /etc/yum.repos.d/kubernetes.repo << EOF
[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/v1.31/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/v1.31/rpm/repodata/repomd.xml.key
exclude=kubelet kubeadm kubectl cri-tools kubernetes-cni
EOF
```

## Kubeadm

Control Node

```bash
sudo yum install -y kubeadm-'1.31.x-*' --disableexcludes=kubernetes
kubeadm version
```

```bash
sudo kubeadm upgrade plan
```

```bash
sudo kubeadm upgrade apply v1.31.x
```

Workers

```bash
sudo yum install -y kubeadm-'1.31.x-*' --disableexcludes=kubernetes
kubeadm version
```

```bash
sudo kubeadm upgrade node
```

## Kubelet and Kubectl

```bash
kubectl drain <node-to-drain> --ignore-daemonsets
```

```bash
sudo yum install -y kubelet-'1.31.x-*' kubectl-'1.31.x-*' --disableexcludes=kubernetes
```

```bash
sudo systemctl daemon-reload
sudo systemctl restart kubelet
```

```bash
kubectl uncordon <node-to-uncordon>
```
