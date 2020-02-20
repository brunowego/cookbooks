# Plugins

## Autosuggestions

```sh
git clone 'https://github.com/zsh-users/zsh-autosuggestions.git' "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
```

```sh
sed -ri 's/^plugins=\((.*)\)/plugins=\(\1 zsh-autosuggestions\)/g' ~/.zshrc
```

```sh
source ~/.zshrc
```

## Completions

```sh
git clone 'https://github.com/zsh-users/zsh-completions.git' "$ZSH_CUSTOM/plugins/zsh-completions"
```

```sh
sed -ri 's/^plugins=\((.*)\)/plugins=\(\1 zsh-completions\)/g' ~/.zshrc
```

```sh
source ~/.zshrc
```

```sh
autoload -U compinit && compinit
```

## History Substring Search

```sh
git clone 'https://github.com/zsh-users/zsh-history-substring-search.git' "$ZSH_CUSTOM/plugins/history-substring-search"
```

```sh
sed -ri 's/^plugins=\((.*)\)/plugins=\(\1 history-substring-search\)/g' ~/.zshrc
```

```sh
source ~/.zshrc
```

## Syntax Highlighting

```sh
git clone 'https://github.com/zsh-users/zsh-syntax-highlighting.git' "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
```

```sh
sed -ri 's/^plugins=\((.*)\)/plugins=\(\1 zsh-syntax-highlighting\)/g' ~/.zshrc
```

```sh
source ~/.zshrc
```
