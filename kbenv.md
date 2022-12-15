# kbenv

<!--
https://github.com/little-angry-clouds/kubernetes-binaries-managers/issues/36
-->

**Keywords:** Kubernetes Version Manager

## Links

- [Code Repository](https://github.com/little-angry-clouds/kubernetes-binaries-managers/tree/master/cmd/kbenv)

## CLI

### Dependencies

Uninstall Pre-existing Versions of [Kubernetes Control (kubectl)](/kubectl/README.md).

```sh
brew uninstall --ignore-dependencies kubernetes-cli
```

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
echo '1.25.4' > ./.kubectl_version
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
kubectl version --short

#
kbenv uninstall <version>
```

### Tips

#### Autocomplete

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# kbenv
source <(kbenv completion zsh) # bash
```

```sh
source ~/.zshrc
```

#### Force Usage of kbenv

```sh
brew link --overwrite kbenv
```
