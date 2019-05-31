# Proxy

## Dependencies

### OS X

#### Homebrew

```sh
brew install iproute2mac
```

## Plugin

```sh
mkdir -p ~/.oh-my-zsh/custom/plugins/proxy
```

```sh
tee ~/.oh-my-zsh/custom/plugins/proxy/proxy.plugin.zsh << 'EOF'
#! /bin/sh

ZSH_PROXY_HOST="$(ip route get 1 | awk '{print $NF;exit}')"
ZSH_PROXY_PORT="3128"

ZSH_HTTP_PROXY="http://$ZSH_PROXY_HOST:$ZSH_PROXY_PORT"
ZSH_HTTPS_PROXY="$ZSH_HTTP_PROXY"
ZSH_NO_PROXY="localhost,127.0.0.1"

proxy-list() {
        echo http_proxy="$http_proxy"
        echo https_proxy="$https_proxy"
        echo no_proxy="$no_proxy"

        echo DOCKER_BUILD_OPTS="$DOCKER_BUILD_OPTS"
}

proxy-set() {
        export http_proxy="$ZSH_HTTP_PROXY"
        export https_proxy="$ZSH_HTTPS_PROXY"
        export no_proxy="$ZSH_NO_PROXY"

        export DOCKER_BUILD_OPTS="--build-arg http_proxy=$http_proxy --build-arg https_proxy=$https_proxy --build-arg no_proxy=$no_proxy"

        proxy-list

        export ZSH_ENABLE_PROXY="1"
}

proxy-unset() {
        unset http_proxy
        unset https_proxy
        unset no_proxy

        unset DOCKER_BUILD_OPTS

        export ZSH_ENABLE_PROXY="0"
}

if [[ "$ZSH_ENABLE_PROXY" && "$ZSH_ENABLE_PROXY" -eq 1 ]]; then
        proxy-set
else
        proxy-unset
fi
EOF
```

## Enabling

```sh
sed -ri 's/^plugins=\((.*)\)/plugins=\(\1 proxy\)/g' ~/.zshrc
```

```sh
source ~/.zshrc
```
