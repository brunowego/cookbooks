# Insecure Registries

## Daemon

### Current User

```sh
#
mkdir -p ~/.docker

#
[[ -f ~/.docker/daemon.json ]] || echo '{}' >> ~/.docker/daemon.json

#
jq '."insecure-registries" += [ "127.0.0.1:5000" ]' ~/.docker/daemon.json | sponge ~/.docker/daemon.json

# Darwin
osascript -e 'quit app "Docker"'
open -a Docker

# Linux
sudo systemctl restart docker

#
docker info | grep 'Insecure Registries' -A 1
```

### Service

```sh
#
sudo mkdir -p /etc/docker

#
[[ ! -f '/etc/docker/daemon.json' ]] && sudo /usr/bin/sh -c 'echo "{}" >> /etc/docker/daemon.json'

#
sudo /usr/bin/sh -c 'jq ".\"insecure-registries\" += [ \"127.0.0.1:5000\" ]" /etc/docker/daemon.json | sponge /etc/docker/daemon.json'

#
sudo systemctl restart docker

#
docker info | grep 'Insecure Registries' -A 1
```

### Docker Machine

```sh
#
eval "$(docker-machine env)"

#
jq ".HostOptions.EngineOptions.InsecureRegistry += [ \"127.0.0.1:5000\" ]" ~/.docker/machine/machines/$DOCKER_MACHINE_NAME/config.json | sponge ~/.docker/machine/machines/$DOCKER_MACHINE_NAME/config.json

#
docker-machine provision "$DOCKER_MACHINE_NAME"

#
docker info | grep 'Insecure Registries' -A 1
```

### minikube

```sh
#
eval "$(minikube docker-env)"

#
jq ".HostOptions.EngineOptions.InsecureRegistry += [ \"127.0.0.1:5000\" ]" ~/.minikube/machines/minikube/config.json | sponge ~/.minikube/machines/minikube/config.json

#
minikube stop && minikube start \
  -p minikube \
  --vm-driver hyperkit

#
docker info | grep 'Insecure Registries' -A 1
```

## Issues

<!-- ###

```log
Error response from daemon: login attempt to http://127.0.0.1:5000/v2/ failed with status: 400 Bad Request
```

TODO -->

<!-- ###

```log
Error response from daemon: Get http://127.0.0.1:5000/v2/: net/http: request canceled (Client.Timeout exceeded while awaiting headers)
```

TODO -->
