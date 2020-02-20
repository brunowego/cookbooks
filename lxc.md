# Linux Containers (LXC)

## Installation

### Homebrew

```sh
brew install lxc
```

## Commands

```sh
lxc -h
```

##

```sh
vagrant ssh -c 'hostname -I | cut -d " " -f 2' 2> /dev/null
```

```sh
lxc remote add vagrant $(vagrant ip)
```

lxc launch ubuntu:x --config=user.user-data="$(cat user-data.yml)"

lxc launch ubuntu:16.04 --ephemeral test-build
lxc exec test-build -- snap install snapcraft --classic
lxc exec test-build -- apt update
lxc exec test-build -- git clone https://github.com/ubuntu/microk8s
lxc exec test-build -- sh -c "cd microk8s && KUBE_VERSION=v1.9.6 snapcraft"

https://github.com/lxc/linuxcontainers.org/blob/master/content/lxd/getting-started-cli.md
