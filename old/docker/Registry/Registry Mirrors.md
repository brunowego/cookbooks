# Registry Mirrors

## Daemon

### Service

```sh
sudo mkdir -p /etc/docker
```

```sh
[[ ! -f '/etc/docker/daemon.json' ]] && sudo /usr/bin/sh -c 'echo "{}" >> /etc/docker/daemon.json'
```

```sh
sudo /usr/bin/sh -c 'jq ".\"registry-mirrors\" += [ \"http://127.0.0.1:5000\" ]" /etc/docker/daemon.json | sponge /etc/docker/daemon.json'
```

```sh
sudo systemctl restart docker
```

```sh
docker info | grep 'Registry Mirrors' -A 1
```

### minikube

```sh
eval "$(minikube docker-env)"
```

```sh
jq ".HostOptions.EngineOptions.RegistryMirror += [ \"http://127.0.0.1:5000\" ]" ~/.minikube/machines/minikube/config.json | sponge ~/.minikube/machines/minikube/config.json
```

```sh
minikube stop && minikube start \
  -p minikube \
  --vm-driver hyperkit
```

```sh
docker info | grep 'Registry Mirrors' -A 1
```

## Test

```sh
time docker pull docker.io/library/redis:latest
```

```sh
# minikube
curl "http://$(minikube ip):5000/v2/_catalog"

# Docker Machine
curl "http://127.0.0.1:5000/v2/_catalog"
```

```sh
docker rmi docker.io/library/redis:latest
```

```sh
time docker pull docker.io/library/redis:latest
```
