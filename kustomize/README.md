# Kustomize

## Links

- [Code Repository](https://github.com/kubernetes-sigs/kustomize)
- [Main Website](https://kustomize.io)
- [Declarative Management of Kubernetes Objects Using Kustomize](https://kubernetes.io/docs/tasks/manage-kubernetes-objects/kustomization/)

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

**Environments:** `local`, `dev`, `qa`, `stg` and `prod`.

```sh
# Create
kustomize create --resources ./.k8s/base

# Preview base
kustomize build ./.k8s/base | \
  yq e -

# Preview local
kustomize build ./.k8s/overlays/local |
  yq e -

# Apply
kustomize build ./.k8s/overlays/local | \
  kubectl apply -f -

# Delete
kustomize build ./.k8s/overlays/local | \
  kubectl delete -f -

# Show difference
diff <(kustomize build ./base) <(kustomize build ./.k8s/overlays/local)
# or, using icdiff
icdiff <(kustomize build ./base) <(kustomize build ./.k8s/overlays/local)
```

### Tips

#### Set Image

```sh
export DOCKER_REGISTRY='docker.io' # ghcr.io
export DOCKER_REPOSITORY='<owner>/<repo>'
export DOCKER_TAG='latest'
```

**Refer:** `./.k8s/base/kustomization.yml`

```yml
---
# ...

images:
  - name: <owner>-<repo>
    newName: $DOCKER_REGISTRY/$DOCKER_REPOSITORY
    newTag: $DOCKER_TAG
```

```sh
( cd ./.k8s/base && kustomize edit set image '<owner>-<repo>'="${DOCKER_REGISTRY}/${DOCKER_REPOSITORY}:${DOCKER_TAG}" )
```

<!-- ### Issues

#### TBD

```log
Error: no matches for OriginalId ~G_v1_ConfigMap|~X|my-app-metadata; no matches for CurrentId ~G_v1_ConfigMap|~X|my-app-metadata; failed to find unique target for patch ~G_v1_ConfigMap|my-app-metadata
```

```yml
resources:
- _app_metadata.yaml
``` -->
