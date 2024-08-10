# Context

Display context list

```bash
kubectl config get-contexts
kubectl config get-contexts -o name
```

Current context

```bash
kubectl config current-context
```

Update current context

```bash
kubectl config use-context <cluster-name>
# kubectl config set-cluster <cluster-name>
```

Check context and namespace alias

```bash
alias kx='f() { [ "$1" ] && kubectl config use-context $1 || kubectl config current-context ; } ; f'
alias kn='f() { [ "$1" ] && kubectl config set-context --current --namespace $1 || kubectl config view --minify | grep namespace | cut -d" " -f6 ; } ; f'
```
