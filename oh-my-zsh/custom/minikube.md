# Minikube

## Dependencies

- [jq](/jq.md)
- [moreutils](/moreutils.md)

## Create

```sh
#
mkdir -p ~/.oh-my-zsh/custom/plugins/minikube

#
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

## Enabling

```sh
#
sed -ri 's/^plugins=\((.*)\)/plugins=\(\1 minikube\)/g' ~/.zshrc

#
source ~/.zshrc
```
