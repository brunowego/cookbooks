# Docker Proxy

## Pull

<!-- ### Darwin

```sh
jq '."proxyHttpMode" |= "manual"' "$HOME/Library/Group\ Containers/group.com.docker/settings.json" | sponge "$HOME/Library/Group\ Containers/group.com.docker/settings.json"

jq ".\"overrideProxyHttp\" |= \"$http_proxy\"" "$HOME/Library/Group\ Containers/group.com.docker/settings.json" | sponge "$HOME/Library/
Group\ Containers/group.com.docker/settings.json"

jq ".\"overrideProxyHttps\" |= \"$https_proxy\"" "$HOME/Library/Group\ Containers/group.com.docker/settings.json" | sponge "$HOME/Library/
Group\ Containers/group.com.docker/settings.json"
``` -->

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
# drop-in
# https://duckduckgo.com/?q=systemd+dropin&t=ffab&atb=v178-1&ia=web

# FIXME issue with echo in linux env
sudo /usr/bin/sh -c 'echo -e "[Service]\nEnvironmentFile=-/etc/sysconfig/docker" > /etc/systemd/system/docker.service.d/http-proxy.conf'
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
[[ -f ~/.docker/config.json ]] || echo '{}' >> ~/.docker/config.json
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
FROM docker.io/alpine:3.9

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

```yml
version: '3.7'

x-proxy-vars: &proxy_vars
  http_proxy: ${http_proxy}
  https_proxy: ${https_proxy}
  no_proxy: ${no_proxy}

services:
  example:
    # for build
    build:
      context: ./path/to/service
      args:
        <<: *proxy_vars

    # for environment
    environment:
      <<: *proxy_vars
```

## Build

```sh
docker build \
  --build-arg http_proxy=$http_proxy \
  --build-arg https_proxy=$https_proxy \
  --build-arg no_proxy=$no_proxy \
  .
```
