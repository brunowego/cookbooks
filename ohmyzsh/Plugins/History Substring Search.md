# History Substring Search

## Installation

```sh
git clone https://github.com/zsh-users/zsh-history-substring-search.git $ZSH_CUSTOM/plugins/history-substring-search
```

## Enabling

```sh
sed -ri 's/^plugins=\((.*)\)/plugins=\(\1 history-substring-search\)/g' ~/.zshrc
```

```sh
source ~/.zshrc
```
