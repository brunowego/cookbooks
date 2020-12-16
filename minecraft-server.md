# Minecraft Server

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h minecraft \
  -e EULA=TRUE \
  -e VERSION=1.16.2 \
  -p 25565:25565 \
  --name minecraft-server \
  --network workbench \
  docker.io/itzg/minecraft-server:latest
```

```sh
docker logs -f minecraft-server
```

### Remove

```sh
docker rm -f minecraft-server
```

## CLI

### Installation

#### Homebrew

```sh
brew cask install minecraft-server
```

### Commands

```sh
minecraft-server -h
```

<!--
### Usage

```sh

``` -->

<!-- ### Issues

#### Docker Machine through VirtualBox

```sh
VBoxManage list vms
```

```sh
VBoxManage controlvm default natpf1 'minecraft-server,tcp,,25565,,25565'
``` -->
