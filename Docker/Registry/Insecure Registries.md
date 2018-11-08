# Insecure Registries

## Info

```sh
docker info | grep 'Insecure Registries' -A 1
```

## Daemon

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
