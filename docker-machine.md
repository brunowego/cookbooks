# Docker Machine

## Installation

### OS X

```sh
curl -L "https://github.com/docker/machine/releases/download/v0.16.1/docker-machine-darwin-x86_64" -o /usr/local/bin/docker-machine
```

```sh
chmod +x /usr/local/bin/docker-machine
```

### Linux

```sh
sudo curl -L "https://github.com/docker/machine/releases/download/v0.16.1/docker-machine-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-machine
```

```sh
sudo chmod +x /usr/local/bin/docker-machine
```

### Chocolatey

```sh
choco install -y docker-machine
```

## Commands

```sh
docker-machine --help
```

### Create

#### Oracle VirtualBox

```sh
docker-machine create \
  --virtualbox-cpu-count 4 \
  --virtualbox-disk-size 40000 \
  --virtualbox-hostonly-cidr '10.100.1.1/24' \
  --virtualbox-memory 8192 \
  default
```

## Configuration

```sh
eval "$(docker-machine env)"
```

### Network

#### Bridge

```sh
jq ".HostOptions.EngineOptions.ArbitraryFlags[0] |= \"bip=10.1.1.1/16\"" ~/.docker/machine/machines/$DOCKER_MACHINE_NAME/config.json | sponge ~/.docker/machine/machines/$DOCKER_MACHINE_NAME/config.json
```

```sh
docker-machine provision
```

```sh
docker-machine ssh $DOCKER_MACHINE_NAME ip addr show docker0
```

#### Proxy

```sh
jq ".HostOptions.EngineOptions.Env[0] |= \"http_proxy=$http_proxy\"" ~/.docker/machine/machines/$DOCKER_MACHINE_NAME/config.json | sponge ~/.docker/machine/machines/$DOCKER_MACHINE_NAME/config.json
jq ".HostOptions.EngineOptions.Env[1] |= \"https_proxy=$https_proxy\"" ~/.docker/machine/machines/$DOCKER_MACHINE_NAME/config.json | sponge ~/.docker/machine/machines/$DOCKER_MACHINE_NAME/config.json
jq ".HostOptions.EngineOptions.Env[2] |= \"no_proxy=$no_proxy\"" ~/.docker/machine/machines/$DOCKER_MACHINE_NAME/config.json | sponge ~/.docker/machine/machines/$DOCKER_MACHINE_NAME/config.json
```

```sh
docker-machine provision
```

```sh
docker info | grep Proxy
```
