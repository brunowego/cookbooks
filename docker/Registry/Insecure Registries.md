# Insecure Registries

## Info

```sh
docker info | grep 'Insecure Registries' -A 1
```

## Daemon

### Unix-like

#### Current User

```sh
mkdir -p ~/.docker
```

```sh
[[ ! -f '~/.docker/daemon.json' ]] && echo '{}' >> ~/.docker/daemon.json
```

```sh
jq '."insecure-registries" |= [ "127.0.0.1:5000" ]' ~/.docker/daemon.json | sponge ~/.docker/daemon.json
```

### Linux

#### Daemon

```sh
sudo mkdir -p /etc/docker
```

```sh
[[ ! -f '/etc/docker/daemon.json' ]] && sudo sh -c 'echo "{}" >> /etc/docker/daemon.json'
```

```sh
sudo sh -c 'jq ".\"insecure-registries\" |= [ \"127.0.0.1:5000\" ]" /etc/docker/daemon.json | sponge /etc/docker/daemon.json'
```

```sh
sudo systemctl restart docker
```

#### Docker Machine

```sh
eval "$(docker-machine env)"
```

```sh
jq ".HostOptions.EngineOptions.InsecureRegistry[0] |= \"127.0.0.1:5000\"" ~/.docker/machine/machines/$DOCKER_MACHINE_NAME/config.json | sponge ~/.docker/machine/machines/$DOCKER_MACHINE_NAME/config.json
```

```sh
docker-machine provision
```
