# Kind Cluster

[Kind](https://kind.sigs.k8s.io/) is a tool for running local Kubernetes clusters using Docker container "nodes".

## Install Docker

```bash
curl -fsSL https://get.docker.com -o install.sh

sh install.sh
rm -f install.sh
sudo usermod -aG docker $USER
newgrp docker
```

## Install Kubectl

<https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/>

```bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
```

```bash
chmod +x kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
```

Alias

```bash
echo 'alias k="kubectl"' >> ~/.bash_aliases
```

Auto completion

```bash
echo 'complete -o default -F __start_kubectl k' >> ~/.bashrc
```

```bash
kubectl version --client --output=yaml
```

## Install Kind

For AMD64 / x86_64

```bash
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
```

```bash
kind --version
```

## Create Cluster

Multinode cluster

```bash
kind create cluster --config 1-config.multinode.yaml
```

Mapping http port

```bash
kind create cluster --config 2-config.portmap.yaml
```

Install for custom CNI

```bash
kind create cluster --config 3-config.cni.yaml
```

```bash
kind create cluster --name dev
```

```bash
kind create cluster --image kindest/node:<version@sha256> --name dev
```

Cluster info

```bash
kind get clusters
```

```bash
kubectl cluster-info
kubectl cluster-info --context kind-dev
```

```bash
kubectl get nodes
```

```bash
docker ps
```

## Delete cluster

```bash
kind delete cluster
```
