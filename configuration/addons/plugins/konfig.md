# Konfig

Merge, split, and manage kubeconfig files.

## Installation

```bash
kubectl krew install konfig
```

## Usage

```bash
kubectl konfig -h
```

Merge another kubeconfig into the current one

```bash
kubectl konfig import --save ~/Downloads/cluster.kubeconfig
```

Export a single context to a separate file

```bash
kubectl konfig export CONTEXT_NAME > context.kubeconfig
```

List all contexts in current kubeconfig

```bash
kubectl config get-contexts
```
