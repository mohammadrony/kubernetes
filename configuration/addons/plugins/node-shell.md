# Node Shell

Open a root shell directly on a node without SSH.

## Installation

```bash
kubectl krew install node-shell
```

## Usage

Open a shell on a node

```bash
kubectl node-shell NODE_NAME
```

Run a command on a node without interactive shell

```bash
kubectl node-shell NODE_NAME -- cat /etc/os-release
```
