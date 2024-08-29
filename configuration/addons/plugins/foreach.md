# Foreach

## Installation

```bash
kubectl krew install foreach
```

## Configuration

Disable prompt for cli session

```bash
tee -a ~/.bashrc << EOF # ~/.zshrc
export KUBECTL_FOREACH_DISABLE_PROMPTS=true
EOF
```

## Usage

```bash
kubectl foreach -h
```

Disable prompt for a command

```bash
kubectl foreach -q -- ...
```

Get pods for all context in default namespace

```bash
kubectl foreach -- get pods
```

Context `a`, `b`, `c` nodes

```bash
kubectl foreach a b c -- get nodes
```

Context having `foo` in name

```bash
kubectl foreach /foo/ -- get nodes
```

Context not having `foo` in name

```bash
kubectl foreach ^/foo/ -- get nodes
```

Update context name with parameter

```bash
kubectl foreach -I _ /foo/ -- --context=_ get pods
```
