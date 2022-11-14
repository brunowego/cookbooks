# kbenv

## Links

- [Code Repository](https://github.com/little-angry-clouds/kubernetes-binaries-managers/tree/master/cmd/kbenv)

## CLI

### Dependencies

Uninstall Pre-existing Versions of [Kubernetes Control (kubectl)](/kubectl/README.md).

### Installation

#### Homebrew

```sh
brew tap little-angry-clouds/homebrew-my-brews
brew install kbenv
```

### Commands

```sh
kbenv help
```

### Configuration

```sh
#
echo '1.3.4' > ./.kubectl_version
```

### Usage

```sh
#
kbenv list remote

#
kbenv install <version>

#
kbenv list local

#
kbenv use <version>

#
kbenv uninstall <version>
```
