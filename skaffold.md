# Skaffold

<!--
https://github.com/khaman1/k8s-services
-->

## Alternatives

- [Draft](https://draft.sh)
- [Tilt](https://tilt.dev)
- [Garden](/garden.md)

## Links

- [Code Repository](https://github.com/GoogleContainerTools/skaffold)
- [Main Website](https://skaffold.dev/)

## Guides

- [Skaffold Pipeline Stages](https://skaffold.dev/docs/pipeline-stages/)
- [File Sync](https://skaffold.dev/docs/pipeline-stages/filesync/)
- [Kustomize](https://skaffold.dev/docs/pipeline-stages/deployers/kustomize/)

## CLI

### Dependencies

- [kompose](/kompose.md)

### Installation

#### Homebrew

```sh
brew install skaffold
```

#### Linux Binary

```sh
curl \
  -L 'https://storage.googleapis.com/skaffold/releases/v1.31.0/skaffold-linux-amd64' \
  -o /usr/local/bin/skaffold && \
    chmod +x /usr/local/bin/skaffold
```

#### Chocolatey

```sh
choco install skaffold
```

### Commands

```sh
skaffold --help
```

### Usage

```sh
#
skaffold config set --global collect-metrics false
skaffold config set --global local-cluster true

#
cat ~/.skaffold/config

#
skaffold config set \
  --kube-context [name] \
  local-cluster true # minikube, kind-default

#
skaffold init
skaffold init --compose-file ./docker-compose.yml # Using Docker Compose file
skaffold init -k ./.k8s/*.yml # Using Kubernetes manifests

#
skaffold dev
skaffold dev --port-forward

#
skaffold run

#
skaffold debug
```

### Tips

#### Autocomplete

```sh
# Skaffold
command -v skaffold > /dev/null && source <(skaffold completion zsh)
```

### Defining Build Artifacts

```sh
scaffold init \
  --compose-file ./docker-compose.yml \
  -a '{"builder":"Docker","payload":{"path":"./.docker/nginx.dev.dockerfile"},"image":"docker.io/library/nginx-jumpstart:latest"}'
```
