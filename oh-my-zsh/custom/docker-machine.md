# Docker Machine

## Dependencies

- [jq](/jq.md)
- [moreutils](/moreutils.md)

## Create

```sh
#
mkdir -p ~/.oh-my-zsh/custom/plugins/docker-machine

#
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

## Enabling

```sh
#
sed -ri 's/^plugins=\((.*)\)/plugins=\(\1 docker-machine\)/g' ~/.zshrc

#
source ~/.zshrc
```
