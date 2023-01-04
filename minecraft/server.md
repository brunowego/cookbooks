# Minecraft Server

## Links

- [Download](https://minecraft.net/download/server)

## Docker

### Links

- [Code Repository](https://github.com/itzg/docker-minecraft-server)

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h minecraft \
  -v minecraft-data:/data \
  -e EULA=TRUE \
  -e VERSION=1.19 \
  -e MAX_PLAYERS=5 \
  -e TYPE=PAPER \
  -e DIFFICULTY=normal \
  -e JVM_DD_OPTS=disable.watchdog:true \
  -p 25565:25565 \
  --name minecraft-server \
  --network workbench \
  docker.io/itzg/minecraft-server:latest

#
docker logs -f minecraft-server
```

### Remove

```sh
docker rm -f minecraft-server

docker volume rm minecraft-data
```

## CLI

### Installation

#### Homebrew

```sh
brew install --cask minecraft-server
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
