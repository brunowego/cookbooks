# OpenSSH Client

## CLI

### Installation

#### Homebrew

```sh
brew install openssh
```

#### YUM

```sh
yum check-update
sudo yum -y install openssh-clients
```

#### APT

```sh
sudo apt update
sudo apt -y install openssh-client
```

#### APK

```sh
sudo apk update
sudo apk add openssh-client
```

### Commands

```sh
sshd --help

ssh-keygen --help
```

## Docker

### Build

```sh
cat << EOF | docker build $(echo $DOCKER_BUILD_OPTS) -t openssh-client -
FROM docker.io/alpine:3.9

RUN apk add -q --no-cache openssh-client

ENTRYPOINT ["/usr/bin/ssh"]
EOF
```

### Running

```sh
docker run -it --rm \
  --name openssh-client \
  docker.io/library/openssh-client:latest $(whoami)@$(ip route get 1 | awk '{print $NF;exit}')
```
