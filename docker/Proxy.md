# Proxy

## Pull

### Linux

```sh
sudo mkdir -p /etc/sysconfig
```

```sh
sudo tee /etc/sysconfig/docker << EOF
HTTP_PROXY=$http_proxy
http_proxy=$http_proxy
HTTPS_PROXY=$https_proxy
https_proxy=$https_proxy
EOF
```

```sh
sudo tee -a /etc/sysconfig/docker << EOF
NO_PROXY=$no_proxy
no_proxy=$no_proxy
EOF
```

```sh
sudo mkdir -p /etc/systemd/system/docker.service.d
```

```sh
sudo sh -c 'echo -e "[Service]\nEnvironmentFile=-/etc/sysconfig/docker" >> /etc/systemd/system/docker.service.d/http-proxy.conf'
```

```sh
sudo systemctl daemon-reload
sudo systemctl show --property EnvironmentFiles docker
sudo systemctl restart docker
```

```sh
docker info | grep Proxy
```

## Container

```sh
mkdir -p ~/.docker
```

```sh
jq ".proxies.default.httpProxy |= \"$http_proxy\"" ~/.docker/config.json | sponge ~/.docker/config.json
jq ".proxies.default.httpsProxy |= \"$https_proxy\"" ~/.docker/config.json | sponge ~/.docker/config.json
jq ".proxies.default.noProxy |= \"$no_proxy\"" ~/.docker/config.json | sponge ~/.docker/config.json
```

### Remove

```sh
jq 'del(.proxies.default.httpProxy, .proxies.default.httpsProxy, .proxies.default.noProxy)' \
  ~/.docker/config.json | sponge ~/.docker/config.json
```

## Dockerfile

```Dockerfile
FROM alpine:3.9

ENV http_proxy=${http_proxy} \
    https_proxy=${https_proxy} \
    no_proxy=${no_proxy}

```

## Image

```sh
docker run -it --rm \
  -e http_proxy=$http_proxy \
  -e https_proxy=$https_proxy \
  -e no_proxy=$no_proxy \
  [image] /bin/bash
```

## Compose

### Inheritance

```yml
x-proxy: &proxy
  http_proxy: ${http_proxy}
  https_proxy: ${https_proxy}
  no_proxy: ${no_proxy}
```

### Environment

```yml
version: '3.6'

services:
  example:
    environment:
      <<: *proxy
```

### Compose

```yml
version: '3.6'

services:
  example:
    build:
      context: ./path/to/service
      args:
        <<: *proxy
```

```sh
docker build \
  --build-arg http_proxy=$http_proxy \
  --build-arg https_proxy=$https_proxy \
  --build-arg no_proxy=$no_proxy \
  .
```
