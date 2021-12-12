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

#### Linux Binary

```sh
KREW_VERSION="$(curl -s https://api.github.com/repos/kubernetes-sigs/krew/releases/latest | grep tag_name | cut -d '"' -f 4 | tr -d 'v')"; \
  curl \
    -L "https://github.com/kubernetes-sigs/krew/releases/download/v${KREW_VERSION}/krew-linux_amd64.tar.gz" | \
      sudo tar \
        -xzC /usr/local/bin \
        --transform 's/krew-linux_amd64/krew/' \
        --exclude LICENSE
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.bashrc` or `$HOME/.zshrc`:

```sh
# Krew
export PATH="${PATH}:${HOME}/.krew/bin"
```

```sh
source ~/.zshrc
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

### Issues

####

```log
Error: unknown command "krew" for "kubectl"
```

