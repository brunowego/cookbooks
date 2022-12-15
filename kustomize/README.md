# Kustomize

<!--
https://github.com/L-U-C-K-Y/kustomize-with-multiple-envs
https://kubernetes.io/docs/tasks/manage-kubernetes-objects/kustomization/
-->

## Links

- [Main Website](https://kustomize.io/)
- [Declarative Management of Kubernetes Objects Using Kustomize](https://kubernetes.io/docs/tasks/manage-kubernetes-objects/kustomization/)

## Alternatives

- [Helm](/helm.md)

## Tools

- [Kubenvz](/kubenvz.md)

## CLI

### Installation

#### Homebrew

```sh
brew install kustomize
```

#### MacPorts

```sh
sudo port install kustomize
```

#### Darwin Binary

```sh
KUSTOMIZE_VERSION="$(curl -s https://api.github.com/repos/kubernetes-sigs/kustomize/releases/latest | grep tag_name | cut -d '"' -f 4 | cut -d '/' -f 2)"; \
  curl \
    -L "https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize/${KUSTOMIZE_VERSION}/kustomize_${KUSTOMIZE_VERSION}_darwin_amd64.tar.gz" | \
      tar -xzC /usr/local/bin
```

#### Linux Binary

```sh
KUSTOMIZE_VERSION="$(curl -s https://api.github.com/repos/kubernetes-sigs/kustomize/releases/latest | grep tag_name | cut -d '"' -f 4 | cut -d '/' -f 2)"; \
  curl \
    -L "https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize/${KUSTOMIZE_VERSION}/kustomize_${KUSTOMIZE_VERSION}_linux_amd64.tar.gz" | \
      tar -xzC /usr/local/bin
```

#### go get

```sh
go install sigs.k8s.io/kustomize/v3/cmd/kustomize
```

#### Chocolatey

```sh
choco install kustomize
```

### Commands

```sh
kustomize -h
```

### Environment

**Node:** Tested with version >= 4.4.0.

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Kustomize
source <(kustomize completion zsh) # bash
```

```sh
sudo su - "$USER"
```

### Usage

**Environments:** local, dev, qa, stg, prod.

```sh
# Create
kustomize create --resources ./base

# Preview base
kustomize build ./base | \
  yq e -

# Preview local
kustomize build ./overlays/local |
  yq e -

# Apply
kustomize build ./overlays/local | \
  kubectl apply -f -

# Delete
kustomize build ./overlays/local | \
  kubectl delete -f -

# Show difference
diff <(kustomize build ./base) <(kustomize build ./overlays/local)
# or, using icdiff
icdiff <(kustomize build ./base) <(kustomize build ./overlays/local)
```

### Tips

#### Set Image

```sh
export DOCKER_REGISTRY='docker.io' # ghcr.io
export DOCKER_REPOSITORY='my-org/my-app'
export DOCKER_TAG='latest'
```

```yml
# kustomization.yaml
images:
  - name: <name>
    newName: $DOCKER_REGISTRY/$DOCKER_REPOSITORY
    newTag: $DOCKER_TAG
```

```sh
kustomize edit set image <name>="${DOCKER_REGISTRY}/${DOCKER_REPOSITORY}:${DOCKER_TAG}"
```

<!-- ### Issues

####

```log
Error: no matches for OriginalId ~G_v1_ConfigMap|~X|my-app-metadata; no matches for CurrentId ~G_v1_ConfigMap|~X|my-app-metadata; failed to find unique target for patch ~G_v1_ConfigMap|my-app-metadata
```

```yml
resources:
- _app_metadata.yaml
``` -->
