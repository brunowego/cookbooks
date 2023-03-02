# Kubeconform

**Keywords:** Kubernetes Manifests Validator

## Links

- [Main Website](https://github.com/yannh/kubeconform)

## CLI

### Installation

#### Homebrew

```sh
brew install kubeconform
```

#### go get

```sh
GOBIN=/usr/local/bin github.com/yannh/kubeconform/cmd/kubeconform@latest
```

### Commands

```sh
kubeconform -h
```

### Usage

```sh
#
kubeconform <filename.yml>
```

<!--
# Validate
kustomize build ./.k8s/overlays/internal | \
  kubeconform -summary
-->
