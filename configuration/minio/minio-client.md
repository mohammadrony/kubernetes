# Minio Client

## Client Install

```bash
curl https://dl.min.io/client/mc/release/linux-amd64/mc \
  --create-dirs \
  -o $HOME/.minio-binaries/mc

chmod +x $HOME/.minio-binaries/mc
```

```bash
# Update ~/.bashrc and ~/.zshrc
export PATH=$PATH:$HOME/.minio-binaries/
```

## Usage

Add Minio Host

```bash
mc alias set MINIO $MINIO_HOST $MINIO_ACCESS_KEY $MINIO_SECRET_KEY
```

```bash
mc admin info MINIO
```
