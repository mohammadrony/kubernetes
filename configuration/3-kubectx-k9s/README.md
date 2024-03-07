# Kubectx Kubens and K9s

## Kubectx and Kubens

```bash
sudo snap install kubectx --classic
```

Switch context

```bash
kubectx ctx_name
```

Switch namespace

```bash
kubens ns_name
```

## K9s

Snap

```bash
sudo snap install k9s
sudo ln -s /snap/k9s/current/bin/k9s /snap/bin/
```

Source

```bash
curl -sS https://webi.sh/k9s | bash
```

```bash
k9s
```

```bash
k9s --readonly
```
