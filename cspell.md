# cspell

**Keywords:** Spell Checker

## Tips

### Visual Studio Code

```sh
#
code --install-extension streetsidesoftware.code-spell-checker

#
code --install-extension streetsidesoftware.code-spell-checker-portuguese-brazilian

#
jq '."recommendations" += ["streetsidesoftware.code-spell-checker"]' "$PWD/.vscode/extensions.json" | sponge "$PWD/.vscode/extensions.json"
```

```sh
# English
jq '."cSpell.language" |= "en"' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"

# English + Portuguese
jq '."cSpell.language" |= "en,pt,pt_BR"' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```

```sh
# Disable
jq '."cSpell.diagnosticLevel" |= "Hint"' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```
