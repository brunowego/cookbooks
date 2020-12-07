# Docker Community Edition (CE)

<!--
https://docs.docker.com/develop/develop-images/build_enhancements/
-->

<!--
Missing file
"${WAR_FILE:?You must especify the WAR_FILE variable in your .env file}:/usr/local/tomcat/webapps/openam.war"
-->

## Tools

- [Lazydocker](/lazydocker.md)

## Daemon

### Installation

#### Homebrew

```sh
brew cask install docker
```

#### APT

##### Xenial Xerus 16.04 and newer

```sh
curl -fsSL 'https://download.docker.com/linux/ubuntu/gpg' | \
  sudo apt-key add - && sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```

```sh
sudo apt update
sudo apt -y install docker-ce
```

#### YUM

```sh
yum check-update
sudo yum-config-manager --add-repo 'https://download.docker.com/linux/centos/docker-ce.repo'
sudo yum -y install docker-ce
```

#### Zypper

```sh
sudo zypper refresh
sudo zypper install -y docker-ce
```

### Service

#### Systemd

```sh
# Wait! Before continue be aware to configure bip
sudo systemctl enable --now docker
```

### Configuration

#### Linux

```sh
sudo groupadd docker
```

```sh
sudo usermod -aG docker "$USER" && \
  sudo su - "$USER"
```

### Uninstall

#### APT

```sh
sudo apt purge -y docker-ce
sudo apt autoremove
```

#### YUM

```sh
sudo yum remove -y docker-ce
```

#### Zypper

```sh
sudo zypper rm docker
```

### Tips

#### Deep Clean

```sh
sudo rm -r /etc/docker
sudo rm -r /var/lib/docker
sudo rm -r /srv/docker
sudo rm -r /etc/sysconfig/docker
sudo rm -r /run/docker
```

```sh
sudo groupdel docker
```

## CLI

### Dependencies

- [hadolint](/hadolint.md)

### Installation

#### Homebrew

```sh
brew install docker
```

#### Linux

```sh
curl https://download.docker.com/linux/static/stable/x86_64/docker-19.03.1.tgz | tar -xzC /usr/local/bin --strip-components 1 docker/docker
```

#### APT

```sh
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  sudo apt-key add - && sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```

```sh
sudo apt update
sudo apt -y install docker-ce-cli
```

#### YUM

```sh
yum check-update
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum -y install docker-ce-cli
```

#### Zypper

```sh
sudo zypper refresh
sudo zypper install -y docker-ce-cli
```

#### Chocolatey

```sh
choco install -y docker-cli
```

### Commands

```sh
docker --help
```

### Tips

<!-- #### BuildKit

```sh
#
sudo /usr/bin/sh -c 'jq ".\"features.buildkit\" += true" /etc/docker/daemon.json | sponge /etc/docker/daemon.json'
``` -->

#### Ignore File

Python example:

```sh
cat << EOF > ./.dockerignore
/**

!/requirements.txt
!/app.py

EOF
```

#### Shell

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

#### Alter Running Container

```sh
docker container stop [name]

docker commit [name] [name]-alt

docker container rm [name]

docker run -d \
  [...]
```

#### Visual Studio Code

```sh
code --install-extension ms-azuretools.vscode-docker
```

```sh
# Darwin
osascript -e 'quit app "Visual Studio Code"'

code --disable-extension ms-azuretools.vscode-docker
```

#### Command-line completion

```sh
# Using Oh My Zsh
sed -ri 's/^plugins=\((.*)\)/plugins=\(\1 docker\)/g' ~/.zshrc

rm ~/.zcompdump*

source ~/.zshrc
```

### Issues

#### Missing Bash

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

#### Endpoint Exists

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

## Dockerfile

### Tips

#### Build Kit

```sh
# CLI
DOCKER_BUILDKIT=0 docker build .

# Daemon
TODO
# {"experimental":false,"features":{"buildkit":true},"insecure-registries":["atf.intranet.bb.com.br:5001","atf.intranet.bb.com.br:5001"]}%
```

#### Work directory

```Dockerfile
WORKDIR /usr/src/[app-name]
```

#### Output

```Dockerfile
RUN echo '\
[text]\
' > [/path/to/file]
```

```Dockerfile
RUN echo '\
[text]\
' | tee [/path/to/file]
```

```Dockerfile
RUN { \
      echo '[text]'; \
      echo '[text]'; \
      echo '[text]'; \
    } > [/path/to/file]
```

#### Entrypoint

```Dockerfile
COPY ./docker-entrypoint.sh /sbin/entrypoint.sh

ENTRYPOINT ["/sbin/entrypoint.sh"]
```

#### Build

```Dockerfile
FROM [repo]/[image]:[tag] AS build

# ---

FROM [repo]/[image]:[tag]

COPY --from=build [/path/to/folder-or-file] [/path/to/destination]
```
