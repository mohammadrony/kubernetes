# Minio Client

## Installation

```bash
curl https://dl.min.io/client/mc/release/linux-amd64/mc \
  --create-dirs \
  -o $HOME/.minio-binaries/mc

chmod +x $HOME/.minio-binaries/mc
```

```bash
# Update ~/.bashrc and ~/.zshrc
export PATH="$PATH:$HOME/.minio-binaries/"
```

```bash
source ~/.bashrc
```

## Commands

```bash
mc --help
```
