# Telnet

## Docker

### Running

```sh
docker run -it --rm \
  $(echo $DOCKER_RUN_OPTS) \
  -h telnet \
  --name telnet \
  brunowego/telnet:1.29.3-r10
```

## Installation

### Homebrew

```sh
brew install telnet
```

### YUM

```sh
sudo yum check-update
sudo yum -y install telnet
```

### APT

```sh
sudo apt update
sudo apt -y install telnet
```

### APK

```sh
sudo apk update
sudo apk add busybox-extras
```

### Chocolatey

```sh
choco install -y telnet
```

## Commands

```sh
man telnet
```
