# Themes

## Dependencies

- [GNU sed](/gnu-sed.md)

## We Disagree (wedisagree)

```sh
# Set theme
sed -i '/^ZSH_THEME/ s/robbyrussell/wedisagree/' ~/.zshrc

# Reload
source ~/.zshrc
```

<!-- ##

```sh
# Change prompt
cat << \EOF >> ~/.zshrc

# Custom Prompt
local user="%{$fg[yellow]%}%n%{$fg[white]%}@%{$fg[green]%}%m%{$reset_color%}"
PROMPT="${user} ${PROMPT}"
RPROMPT='%{$fg[magenta]%}$(git_prompt_info)%{$reset_color%}$(git_prompt_status)%{$reset_color%}$(git_prompt_ahead)%{$reset_color%}'
EOF

# Reload
source ~/.zshrc
``` -->
