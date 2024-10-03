# Stern

Logs

## Installation

```bash
kubectl krew install stern
```

## Usage

```bash
kubectl stern --no-follow --only-log-lines --since=2m -A
```
