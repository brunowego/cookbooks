# Docker Community Edition (CE) CLI

## Dependencies

- [hadolint](/hadolint.md)

## Installation

### Homebrew

```sh
brew install docker
```

### Linux

```sh
curl https://download.docker.com/linux/static/stable/x86_64/docker-19.03.1.tgz | \
  tar -xzC /usr/local/bin --strip-components 1 docker/docker
```

### APT

```sh
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  sudo apt-key add - && sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```

```sh
sudo apt update
sudo apt -y install docker-ce-cli
```

### YUM

```sh
yum check-update
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum -y install docker-ce-cli
```

### Zypper

```sh
sudo zypper refresh
sudo zypper install -y docker-ce-cli
```

### Chocolatey

```sh
choco install -y docker-cli
```

## Commands

```sh
docker --help
```

## Usage

```sh
# Show disk usage
docker system df -v
```

## Tips

### Process Format

```sh
#
docker ps --format '{{.Image}}'

#
docker ps --format '{{.Names}}'

#
docker ps --format "table {{ .ID }}\t{{.Names}}\t{{.Status}}"

#
docker ps | less -S
```

<!-- ####

```sh
#! /bin/bash

DOCKER_BUILD_OPTS=${DOCKER_BUILD_OPTS:-}

docker build \
  $DOCKER_BUILD_OPTS \
  # ...
```

***Issues***: Remove use of `IFS=$'\n\t'` -->

### Disable IPv6

```sh
# Darvin daemon config (need reload docker daemon)
jq '.ipv6 |= false' ~/.docker/daemon.json | sponge ~/.docker/daemon.json

# or, Linux daemon config (need reload docker daemon)
sudo /usr/bin/sh -c 'jq ".ipv6 |= false" /etc/docker/daemon.json | sponge /etc/docker/daemon.json'
```

### Disable BuildKit

```sh
# Environment variable
DOCKER_BUILDKIT=0 docker build ./

# or, Darvin daemon config (need reload docker daemon)
jq '.features.buildkit |= false' ~/.docker/daemon.json | sponge ~/.docker/daemon.json

# or, Linux daemon config (need reload docker daemon)
sudo /usr/bin/sh -c 'jq ".features.buildkit |= false" /etc/docker/daemon.json | sponge /etc/docker/daemon.json'
```

### Ignore File

***Python Example***

```sh
cat << EOF > ./.dockerignore
/*

!/requirements.txt
!/app.py

EOF
```

### Shell

```sh
#
docker run -i --rm \
  ...
  [repo] /bin/sh -c '[command]'

#
docker run -i --rm \
  ...
  [repo] /bin/sh << \EOSHELL

EOSHELL
```

### Alter Running Container

```sh
docker container stop [name]

docker commit [name] [name]-alt

docker container rm [name]

docker run -d \
  [...]
```

### Visual Studio Code

```sh
code --install-extension ms-azuretools.vscode-docker
```

```sh
# Darwin
osascript -e 'quit app "Visual Studio Code"'

code --disable-extension ms-azuretools.vscode-docker
```

### Command-line completion

```sh
# Using Oh My Zsh
sed -ri 's/^plugins=\((.*)\)/plugins=\(\1 docker\)/g' ~/.zshrc

rm ~/.zcompdump*

source ~/.zshrc
```

## Issues

### Daemon Error Response

```log
Error response from daemon: Get http://hostname/v2/: net/http: request canceled while waiting for connection (Client.Timeout exceeded while awaiting headers)
```

Run with proxy environment variables.

<!-- ```sh
# Perhaps using wrong user:password at proxy. After change, restart docker daemon.
cat /etc/sysconfig/docker
``` -->

### Missing Bash

```log
standard_init_linux.go:211: exec user process caused "no such file or directory"
```

```sh
# From
#! /bin/bash

# To
#! /bin/sh
```

Or, install [bash](/bash_unix_shell.md)

<!-- ####

```log
Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?
```

TODO -->

### Endpoint Exists

```log
docker: Error response from daemon: endpoint with name [container] already exists in network [network].
```

```sh
docker network disconnect -f [network] [container]
```

<!-- #### Bad Credential

```log
Error response from daemon: Get https://127.0.0.1:5000/v2/: unauthorized: BAD_CREDENTIAL
```

TODO -->

<!-- #### Device or resource busy

TODO -->

<!--
http://blog.jonathanargentiero.com/docker-sed-cannot-rename-etcsedl8ysxl-device-or-resource-busy/
-->
