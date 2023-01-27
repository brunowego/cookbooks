# Podman

## Links

- [Code Repository](https://github.com/containers/podman)
- [Main Website](https://podman.io)

## Guides

- [Podman Remote clients for macOS and Windows](https://github.com/containers/podman/blob/master/docs/tutorials/mac_win_client.md)

## CLI

### Installation

#### Homebrew

```sh
brew install podman
```

#### APT

```sh
sudo apt update
sudo apt -y install podman
```

#### YUM

```sh
yum check-update
sudo yum -y install podman
```

#### Zypper

```sh
sudo zypper refresh
sudo zypper install -y podman
```

### Commands

```sh
podman --help
```

### Usage

```sh
#
podman info

#
podman search httpd --filter=is-official

#
podman pull docker.io/library/httpd

#
podman images

#
podman run \
  -dt \
  -p 8080:80/tcp \
  docker.io/library/httpd

#
podman ps

#
podman logs -l

#
podman top -l

#
podman stop -l
```

<!--
#
podman login registry.redhat.io
-->

<!-- ### Issues

#### TBD

```log
Error: cannot connect to the Podman socket, please verify that Podman REST API service is running: Get "http://d/v3.2.0/libpod/_ping": dial unix ///var/folders/nf/0gjkdqf53q9fpdy0xdy24m800000gn/T/podman-run--1/podman/podman.sock: connect: no such file or directory
``` -->
