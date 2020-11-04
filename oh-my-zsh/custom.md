# Custom

## Plugins

### Proxy

#### Dependencies

- [iproute2](/iproute2.md)

#### Create

```sh
mkdir -p ~/.oh-my-zsh/custom/plugins/proxy
```

```sh
tee ~/.oh-my-zsh/custom/plugins/proxy/proxy.plugin.zsh << 'EOF'
#! /bin/sh

ZSH_PROXY_HOST=
ZSH_PROXY_PORT='3128'

ZSH_HTTP_PROXY="http://$ZSH_PROXY_HOST:$ZSH_PROXY_PORT"
ZSH_HTTPS_PROXY="$ZSH_HTTP_PROXY"
ZSH_SOCKS_PROXY="$ZSH_HTTP_PROXY"
ZSH_NO_PROXY="localhost,127.0.0.1,$ZSH_PROXY_HOST"

proxy-list() {
        echo http_proxy="$http_proxy"
        echo https_proxy="$https_proxy"
        echo socks_proxy="$socks_proxy"
        echo no_proxy="$no_proxy"

        echo DOCKER_BUILD_OPTS="$DOCKER_BUILD_OPTS"
        echo DOCKER_RUN_OPTS="$DOCKER_RUN_OPTS"
        echo MINIKUBE_START_OPTS="$MINIKUBE_START_OPTS"
        echo DOCKER_MACHINE_CREATE_OPTS="$DOCKER_MACHINE_CREATE_OPTS"
        echo JAVA_OPTS="$JAVA_OPTS"
        echo MAVEN_OPTS="$MAVEN_OPTS"
        echo S2I_FLAGS="$S2I_FLAGS"
}

proxy-set() {
        export http_proxy="$ZSH_HTTP_PROXY"
        export https_proxy="$ZSH_HTTPS_PROXY"
        export socks_proxy="$ZSH_SOCKS_PROXY"
        export no_proxy="$ZSH_NO_PROXY"

        export DOCKER_BUILD_OPTS="$DOCKER_BUILD_OPTS --build-arg http_proxy=$http_proxy --build-arg https_proxy=$https_proxy --build-arg no_proxy=$no_proxy"
        export DOCKER_RUN_OPTS="$DOCKER_RUN_OPTS -e http_proxy=$http_proxy -e https_proxy=$https_proxy -e socks_proxy=$socks_proxy -e no_proxy=$no_proxy"
        export MINIKUBE_START_OPTS="$MINIKUBE_START_OPTS --docker-env http_proxy=$http_proxy --docker-env https_proxy=$https_proxy --docker-env socks_proxy=$socks_proxy --docker-env no_proxy=$no_proxy"
        export DOCKER_MACHINE_CREATE_OPTS="$DOCKER_MACHINE_CREATE_OPTS --engine-env http_proxy=$http_proxy --engine-env https_proxy=$https_proxy --engine-env socks_proxy=$socks_proxy --engine-env no_proxy=$no_proxy"
        export JAVA_OPTS="$JAVA_OPTS -Dhttp.proxyHost=$ZSH_PROXY_HOST -Dhttp.proxyPort=$ZSH_PROXY_PORT -Dhttps.proxyHost=$ZSH_PROXY_HOST -Dhttps.proxyPort=$ZSH_PROXY_PORT"
        export MAVEN_OPTS="$MAVEN_OPTS -Dhttp.proxyHost=$ZSH_PROXY_HOST -Dhttp.proxyPort=$ZSH_PROXY_PORT -Dhttps.proxyHost=$ZSH_PROXY_HOST -Dhttps.proxyPort=$ZSH_PROXY_PORT"
        export S2I_FLAGS="$S2I_FLAGS -e http_proxy=$http_proxy -e https_proxy=$https_proxy -e no_proxy=$no_proxy"

        proxy-list

        export ZSH_ENABLE_PROXY='1'
}

proxy-unset() {
        unset http_proxy
        unset https_proxy
        unset socks_proxy
        unset no_proxy

        unset DOCKER_BUILD_OPTS
        unset DOCKER_RUN_OPTS
        unset MINIKUBE_START_OPTS
        unset DOCKER_MACHINE_CREATE_OPTS
        unset JAVA_OPTS
        unset MAVEN_OPTS
        unset S2I_FLAGS

        export ZSH_ENABLE_PROXY='0'
}

if [[ "$ZSH_ENABLE_PROXY" && "$ZSH_ENABLE_PROXY" -eq 1 ]]; then
        proxy-set
else
        proxy-unset
fi
EOF
```

```sh
#
sed -i "/^ZSH_PROXY_HOST/ s/=.*/='127.0.0.1'/g" ~/.oh-my-zsh/custom/plugins/proxy/proxy.plugin.zsh

# Darwin???
sed -i '/^ZSH_PROXY_HOST/ s/=/="$(ip route get 1 | awk '\''{print $NF;exit}'\'')"/g' ~/.oh-my-zsh/custom/plugins/proxy/proxy.plugin.zsh

# Linux???
sed -i '/^ZSH_PROXY_HOST/ s/=/="$(ip route get 1 | awk '\''{print $7;exit}'\'')"/g' ~/.oh-my-zsh/custom/plugins/proxy/proxy.plugin.zsh
```

#### Enabling

```sh
sed -ri 's/^plugins=\((.*)\)/plugins=\(\1 proxy\)/g' ~/.zshrc
```

```sh
source ~/.zshrc
```

### Docker Machine

#### Dependencies

##### Homebrew

```sh
brew install jq moreutils
```

#### Create

```sh
mkdir -p ~/.oh-my-zsh/custom/plugins/docker-machine
```

```sh
tee ~/.oh-my-zsh/custom/plugins/docker-machine/docker-machine.plugin.zsh << 'EOF'
#! /bin/sh

docker-machine-env() {
        eval "$(docker-machine env)"

        if [[ "$ZSH_ENABLE_PROXY" && "$ZSH_ENABLE_PROXY" -eq 1 ]]; then
                export no_proxy="$ZSH_NO_PROXY,127.0.0.1"
        fi
}

docker-machine-proxy-list() {
        docker-machine-env

        if [[ "$ZSH_ENABLE_PROXY" && "$ZSH_ENABLE_PROXY" -eq 1 ]]; then
                docker info | grep Proxy
        fi
}

docker-machine-reload() {
        docker-machine provision "$DOCKER_MACHINE_NAME"

        docker-machine-env
}

docker-machine-proxy() {
        docker-machine-env

        if [[ "$ZSH_ENABLE_PROXY" && "$ZSH_ENABLE_PROXY" -eq 1 ]]; then
                jq ".HostOptions.EngineOptions.Env[0] |= \"http_proxy=$http_proxy\"" ~/.docker/machine/machines/default/config.json | sponge ~/.docker/machine/machines/default/config.json
                jq ".HostOptions.EngineOptions.Env[1] |= \"https_proxy=$https_proxy\"" ~/.docker/machine/machines/default/config.json | sponge ~/.docker/machine/machines/default/config.json
                jq ".HostOptions.EngineOptions.Env[2] |= \"no_proxy=$no_proxy\"" ~/.docker/machine/machines/default/config.json | sponge ~/.docker/machine/machines/default/config.json
        else
                jq '.HostOptions.EngineOptions.Env |= []' ~/.docker/machine/machines/default/config.json | sponge ~/.docker/machine/machines/default/config.json
        fi

        if [[ "$(docker-machine status | grep 'Stopped')" ]]; then
                docker-machine start
        else
                docker-machine provision "$DOCKER_MACHINE_NAME"
        fi

        docker-machine-proxy-list
}

EOF
```

#### Enabling

```sh
sed -ri 's/^plugins=\((.*)\)/plugins=\(\1 docker-machine\)/g' ~/.zshrc
```

```sh
source ~/.zshrc
```

### Minikube

#### Dependencies

##### Homebrew

```sh
brew install jq moreutils
```

#### Plugin

```sh
mkdir -p ~/.oh-my-zsh/custom/plugins/minikube
```

```sh
tee ~/.oh-my-zsh/custom/plugins/minikube/minikube.plugin.zsh << 'EOF'
#! /bin/sh

minikube-env() {
        eval "$(minikube docker-env)"

        if [[ "$ZSH_ENABLE_PROXY" && "$ZSH_ENABLE_PROXY" -eq 1 ]]; then
                export no_proxy="$ZSH_NO_PROXY,$(minikube ip)"
        fi
}

minikube-proxy-list() {
        minikube-env

        if [[ "$ZSH_ENABLE_PROXY" && "$ZSH_ENABLE_PROXY" -eq 1 ]]; then
                docker info | grep Proxy
        fi
}

minikube-reload() {
        minikube-env
        minikube stop
        minikube start --vm-driver hyperkit
}

minikube-proxy() {
        minikube-env
        minikube stop

        if [[ "$ZSH_ENABLE_PROXY" && "$ZSH_ENABLE_PROXY" -eq 1 ]]; then
                jq ".HostOptions.EngineOptions.Env[0] |= \"http_proxy=$http_proxy\"" ~/.minikube/machines/minikube/config.json | sponge ~/.minikube/machines/minikube/config.json
                jq ".HostOptions.EngineOptions.Env[1] |= \"https_proxy=$https_proxy\"" ~/.minikube/machines/minikube/config.json | sponge ~/.minikube/machines/minikube/config.json
                jq ".HostOptions.EngineOptions.Env[2] |= \"no_proxy=$no_proxy\"" ~/.minikube/machines/minikube/config.json | sponge ~/.minikube/machines/minikube/config.json
        else
                jq '.HostOptions.EngineOptions.Env |= []' ~/.minikube/machines/minikube/config.json | sponge ~/.minikube/machines/minikube/config.json
        fi

        minikube start --vm-driver hyperkit
        minikube-proxy-list
}

EOF
```

#### Enabling

```sh
sed -ri 's/^plugins=\((.*)\)/plugins=\(\1 minikube\)/g' ~/.zshrc
```

```sh
source ~/.zshrc
```
