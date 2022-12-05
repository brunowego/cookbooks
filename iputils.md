# iputils

**Keywords:** Trace Route

## Links

- [Code Repository](https://github.com/iputils/iputils)

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
#
docker run -it --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  -h iputils \
  --name iputils \
  --network workbench \
  docker.io/brunowego/iputils:latest /bin/sh
```

## CLI

### Installation

#### APT

```sh
sudo apt update
# ping
sudo apt -y install iputils-ping
# arping
sudo apt -y install iputils-arping
# clockdiff
sudo apt -y install iputils-clockdiff
# tracepath
sudo apt -y install iputils-tracepath
```

#### YUM

```sh
yum check-update
sudo yum -y install iputils
```

#### APK

```sh
sudo apk update
sudo apk add iputils
```

### Commands

```sh
arping
clockdiff
ping
rdisc
tracepath
```

### Usage

```sh
#
tracepath -n <domain>
```
