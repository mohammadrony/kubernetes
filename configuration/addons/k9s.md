# K9s

Snap

```bash
sudo snap install k9s
sudo ln -s /snap/k9s/current/bin/k9s /snap/bin/
```

Source

```bash
curl -L https://webi.sh/k9s -o install.sh

sh install.sh
rm -f install.sh
```

Usage

```bash
k9s
```

```bash
k9s -n namespace
k9s --context cluster
```

```bash
k9s --readonly
```
