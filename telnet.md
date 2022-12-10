# Telnet

## Links

- [Wikipedia](https://en.wikipedia.org/wiki/Telnet)

## CLI

### Installation

#### Homebrew

```sh
brew install telnet
```

#### YUM

```sh
yum check-update
sudo yum -y install telnet
```

#### APT

```sh
sudo apt update
sudo apt -y install telnet
```

#### APK

```sh
sudo apk update
sudo apk add busybox-extras
```

#### Chocolatey

```sh
choco install -y telnet
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

## Kubectl

### Running

```sh
kubectl run -it \
  telnet \
  --image docker.io/brunowego/telnet:1.29.3-r10
```
