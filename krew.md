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
kubectl krew search [package]

#
kubectl krew install access-matrix
kubectl krew install config-cleanup
kubectl krew install exec-all
kubectl krew install fleet
kubectl krew install get-all
kubectl krew install grep
kubectl krew install konfig
kubectl krew install kubesec-scan
kubectl krew install kudo
kubectl krew install neat
kubectl krew install pod-dive
kubectl krew install rbac-lookup
kubectl krew install resource-capacity
kubectl krew install sniff
kubectl krew install starboard
kubectl krew install sudo
kubectl krew install tree
kubectl krew install view-secret
kubectl krew install who-can
```
