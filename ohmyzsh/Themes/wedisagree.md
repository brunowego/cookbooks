# We Disagree (wedisagree)

## Setting

```sh
sed -i '/^ZSH_THEME/s/robbyrussell/wedisagree/g' ~/.zshrc
```

```sh
source ~/.zshrc
```

## Prompt

### Add username and hostname

```sh
echo -e '\n# Custom Prompt
local user="%{$fg[yellow]%}%n%{$fg[white]%}@%{$fg[green]%}%m%{$reset_color%}"
PROMPT="${user} ${PROMPT}"' >> ~/.zshrc
```

```sh
source ~/.zshrc
```

## Legend

### Git

- Prefix: `☁`
- Dirty: `☂`
- Untracked: `✭`
- Clean: `☀`
- Added: `✚`
- Modified: `⚡`
- Deleted: `✖`
- Renamed: `➜`
- Unmerged: `♒`
- Ahead: `𝝙`
