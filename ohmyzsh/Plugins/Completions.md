# Completions

## Installation

```sh
git clone https://github.com/zsh-users/zsh-completions.git $ZSH_CUSTOM/plugins/zsh-completions
```

## Enabling

```sh
sed -ri 's/^plugins=\((.*)\)/plugins=\(\1 zsh-completions\)/g' ~/.zshrc
```

```sh
source ~/.zshrc
```

```sh
autoload -U compinit && compinit
```
