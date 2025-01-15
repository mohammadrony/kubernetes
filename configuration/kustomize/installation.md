# Installation

```bash
curl https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh -o install.sh

bash install.sh
rm -f install.sh
sudo mv kustomize /usr/local/bin/
```

Install from Go source. Requires [Go](https://go.dev/doc/install) to be installed.

```bash
GOBIN=$(pwd)/ GO111MODULE=on go install sigs.k8s.io/kustomize/kustomize/v5@latest
```
