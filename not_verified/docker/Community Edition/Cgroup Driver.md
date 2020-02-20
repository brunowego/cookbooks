# Cgroup Driver

## Info

```sh
docker info | grep -i 'Cgroup Driver'
```

## systemd

```sh
sudo mkdir -p /etc/docker
```

```sh
[[ ! -f '/etc/docker/daemon.json' ]] && sudo /usr/bin/sh -c 'echo "{}" >> /etc/docker/daemon.json'
```

```sh
sudo /usr/bin/sh -c 'jq ".\"exec-opts\" |= [ \"native.cgroupdriver=systemd\" ]" /etc/docker/daemon.json | sponge /etc/docker/daemon.json'
```

```sh
sudo systemctl restart docker
```

## cgroupfs

Native.
