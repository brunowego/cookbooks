# Krew

## Links

- [Code Repository](https://github.com/kubernetes-sigs/krew)
- [Main Website](https://krew.sigs.k8s.io/)
- [Plugins](https://krew.sigs.k8s.io/plugins/)

## CLI

### Installation

#### Homebrew

```sh
brew install krew
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Krew
export PATH="${PATH}:${HOME}/.krew/bin"
```

### Commands

```sh
kubectl krew -h
```

### Usage

```sh
#
kubectl krew upgrade

#
kubectl krew list

#
kubectl krew search '[package]'
```

<!--
# Non-official
kubectl krew install exec-all
-->
