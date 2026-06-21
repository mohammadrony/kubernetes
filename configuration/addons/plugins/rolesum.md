# Rolesum

Summarize all RBAC permissions for a user, group, or service account.

## Installation

```bash
kubectl krew install rolesum
```

## Usage

```bash
kubectl rolesum -h
```

Summarize permissions for a service account

```bash
kubectl rolesum -n NAMESPACE SERVICE_ACCOUNT
```

Summarize permissions for a user

```bash
kubectl rolesum -k User USERNAME
```

Summarize permissions for a group

```bash
kubectl rolesum -k Group GROUP_NAME
```
