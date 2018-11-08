# Registry Mirrors

## Info

```sh
docker info | grep 'Registry Mirrors' -A 1
```

## Daemon

```sh
sudo mkdir -p /etc/docker
```

```sh
[[ ! -f '/etc/docker/daemon.json' ]] && sudo sh -c 'echo "{}" >> /etc/docker/daemon.json'
```

```sh
sudo sh -c 'jq ".\"registry-mirrors\" |= [ \"http://127.0.0.1:5000\" ]" /etc/docker/daemon.json | sponge /etc/docker/daemon.json'
```

```sh
sudo systemctl restart docker
```

## Test

```sh
time docker pull redis:latest
```

```sh
curl http://127.0.0.1:5000/v2/_catalog
```

```sh
docker rmi redis:latest
```

```sh
time docker pull redis:latest
```
