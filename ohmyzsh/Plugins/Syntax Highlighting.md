# Syntax Highlighting

## Installation

```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
```

## Enabling

```sh
sed -ri 's/^plugins=\((.*)\)/plugins=\(\1 zsh-syntax-highlighting\)/g' ~/.zshrc
```

```sh
source ~/.zshrc
```
