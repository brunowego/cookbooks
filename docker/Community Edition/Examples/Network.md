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

## Delete

```sh
docker network rm $(docker network ls | grep "bridge" | awk '/ / { print $1 }')
```

## Show Docker IP Address

```sh
ip addr show dev docker0 | awk -F'[ /]*' '/inet /{print $3}'
```

## BIP

### Unix-like

#### Current User

```sh
mkdir -p ~/.docker
```

```sh
[[ ! -f '~/.docker/daemon.json' ]] && echo '{}' >> ~/.docker/daemon.json
```

```sh
jq '.bip |= "172.17.0.1/16"' ~/.docker/daemon.json | sponge ~/.docker/daemon.json
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
sudo sh -c 'jq ".bip |= \"172.17.0.1/16\"" /etc/docker/daemon.json | sponge /etc/docker/daemon.json'
```

```sh
sudo systemctl restart docker
```
