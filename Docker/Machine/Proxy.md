# Proxy

## Machine default

### Create

```sh
docker-machine create \
  --engine-env http_proxy=$http_proxy \
  --engine-env https_proxy=$https_proxy \
  --engine-env no_proxy=$no_proxy \
  default
```

### Config

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
