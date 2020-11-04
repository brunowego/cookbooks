# Ncat

## CLI

### Installation

#### Homebrew

Included in [Nmap package](/nmap.md#homebrew).

#### APT

Included in [Nmap package](/nmap.md#apt).

#### YUM

```sh
yum check-update
sudo yum -y install nc
```

#### APK

```sh
sudo apk update
sudo apk add nmap-ncat
```

### Commands

```sh
# Ubuntu/Darwin
ncat -h

# Linux
nc -h
```

### Usage

```sh
# Check first if the port is busy
lsof -i :9000

# Listen connection
ncat -lp 9000

# Assign connection
ncat 127.0.0.1 9000

# Or, forward connection
ncat \
  -c 'ncat 127.0.0.1 9000' \
  -lp 9001 \
  --keep-open

ncat 127.0.0.1 9001

ncat \
  --proxy 127.0.0.1:3128 \
  --proxy-type http \
  127.0.0.1 9001

# Closing
pkill ncat
```
