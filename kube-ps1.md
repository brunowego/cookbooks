# kube-ps1

## Links

- [Code Repository](https://github.com/jonmosco/kube-ps1)

## CLI

### Installation

#### Homebrew

```sh
brew install kube-ps1
```

### Environment

For Bash or Zsh, put something like this in your `$HOME/.zshrc`:

```sh
# kube-ps1
export KUBE_PS1_SUFFIX=') '
PROMPT=$PROMPT'$(kube_ps1)'
```

```sh
# Using Oh My Zsh
sed -ri 's/^plugins=\((.*)\)/plugins=\(\1 kube-ps1\)/g' ~/.zshrc

#
source ~/.zshrc
```

### On/Off

```sh
#
kubeon -g

#
kubeoff -g
```
