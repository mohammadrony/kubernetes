# Ksniff

## Installation

Sniff plugins depencency

```bash
sudo apt install -y wireshark
```

```bash
sudo dpkg-reconfigure wireshark-common
# yes
```

Run command as non-root user

```bash
sudo chmod +x /usr/bin/dumpcap
```

Install plugin

```bash
kubectl krew install sniff
```

Alias

```bash
alias ksniff='kubectl sniff'
```

## Usage

```bash
ksniff -h
```

```bash
ksniff POD
```

```bash
ksniff POD -n NAMESPACE
ksniff POD -c CONTAINER
```
