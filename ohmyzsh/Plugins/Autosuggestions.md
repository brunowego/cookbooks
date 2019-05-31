# Autosuggestions

## Installation

```sh
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
```

## Enabling

```sh
sed -ri 's/^plugins=\((.*)\)/plugins=\(\1 zsh-autosuggestions\)/g' ~/.zshrc
```

```sh
source ~/.zshrc
```
