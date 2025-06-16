# Telnet

## Links

- [Wikipedia](https://en.wikipedia.org/wiki/Telnet)

## CLI

### Installation

```sh
# Using Homebrew
brew install telnet

# Using YUM
yum check-update
sudo yum -y install telnet

# Using APT
sudo apt update
sudo apt -y install telnet

# Using APK
sudo apk update
sudo apk add busybox-extras

# Using Chocolatey
choco install -y telnet

# Using Windows
Install-WindowsFeature -Name Telnet-Client
```

### Commands

```sh
man telnet
```

### Usage

```sh
#
telnet <host> <port>
```

## Docker

### Running

```sh
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h telnet \
  --name telnet \
  docker.io/brunowego/telnet:1.29.3-r10
```

### Remove

```sh
docker rm -f telnet
```

## Kubernetes

### Running

```sh
kubectl run -it \
  telnet \
  --image docker.io/brunowego/telnet:1.29.3-r10
```
