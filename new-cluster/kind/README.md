# Kind Cluster

[Kind](https://kind.sigs.k8s.io/) is a tool for running local Kubernetes clusters using Docker container "nodes".

## Install Docker

Add Docker's official GPG key

```bash
sudo apt update
sudo apt -y install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```

Add the repository to Apt sources

```bash
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
```

Install Latest docker version

```bash
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
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

```bash
kubectl version --client --output=yaml
```

Bash auto completion

```bash
sudo apt install -y bash-completion
```

```bash
echo 'alias k=kubectl' >>~/.bashrc
echo 'complete -o default -F __start_kubectl k' >>~/.bashrc
```

```bash
source ~/.bashrc
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

```bash
kind create cluster --config=config.yaml
```

```bash
kind create cluster --name cluster-2
```

```bash
kind create cluster --image kindest/node:<version@sha256> --name cluster-3
```

Cluster info

```bash
kind get clusters
```

```bash
kubectl cluster-info
kubectl cluster-info --context kind-kind
kubectl cluster-info --context kind-kind-2
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
