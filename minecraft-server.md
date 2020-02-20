# Minecraft Server

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h minecraft \
  -e EULA=TRUE \
  -e VERSION=1.12 \
  -p 25565:25565 \
  --name minecraft-server \
  itzg/minecraft-server:latest
```

### Remove

```sh
docker rm -f minecraft-server
```

## Installation

### Howbrew

```sh
brew cask install minecraft-server
```

## Commands

```sh
minecraft-server -h
```

## Issues

### Docker Machine through VirtualBox

```sh
VBoxManage list vms
```

```sh
VBoxManage controlvm default natpf1 'minecraft-server,tcp,,25565,,25565'
```
