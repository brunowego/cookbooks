# Network

## Create

```sh
docker network create [name]
```

### With subnet

```sh
docker network create --subnet=[IP]/16 [name]
```

### With driver

```sh
docker network create --driver [driver_name] [name]
```

- [Network drivers](https://docs.docker.com/network/#network-drivers)

## Show

```sh
ip link show docker0
```

## Remove

```sh
sudo ip link set dev docker0 down
sudo ip link del docker0
```

```sh
# Systemd
sudo systemctl stop docker
sudo systemctl restart docker
```

## Delete

```sh
docker network rm $(docker network ls | grep "bridge" | awk '/ / { print $1 }')
```

## Show Docker IP Address

```sh
ip addr show dev docker0 | awk -F'[ /]*' '/inet /{print $3}'
```

## Bridge IP (BIP)

### Current User

#### Unix-like

```sh
mkdir -p ~/.docker
```

```sh
[[ -f ~/.docker/daemon.json ]] || echo '{}' >> ~/.docker/daemon.json
```

```sh
jq '.bip |= "172.17.0.1/16"' ~/.docker/daemon.json | sponge ~/.docker/daemon.json

#
jq '.bip |= "1.1.0.1/16"' ~/.docker/daemon.json | sponge ~/.docker/daemon.json
```

```sh
# Darwin
osascript -e 'quit app "Docker"'
open -a Docker

# Systemd
sudo systemctl restart docker
```

### Daemon

#### Linux

```sh
sudo mkdir -p /etc/docker
```

```sh
[[ ! -f '/etc/docker/daemon.json' ]] && sudo /usr/bin/sh -c 'echo "{}" >> /etc/docker/daemon.json'
```

```sh
sudo /usr/bin/sh -c 'jq ".bip |= \"172.17.0.1/16\"" /etc/docker/daemon.json | sponge /etc/docker/daemon.json'

#
sudo /usr/bin/sh -c 'jq ".bip |= \"1.1.0.1/16\"" /etc/docker/daemon.json | sponge /etc/docker/daemon.json'
```

```sh
sudo systemctl restart docker
```
