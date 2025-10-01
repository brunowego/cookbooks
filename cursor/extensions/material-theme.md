# Visual Studio Code Theme

## Dependencies

- [Fira Code Font](/fira-code-font.md)

## Material Theme

```sh
# Install
cursor --install-extension zhuangtongfa.Material-theme

#
jq '."recommendations" += ["zhuangtongfa.Material-theme"]' "$HOME"/.cursor/extensions.json | sponge "$HOME"/.cursor/extensions.json
```

**Configuration:**

```sh
#
jq '."workbench.colorTheme" |= "One Dark Pro"' "$HOME"/.cursor/settings.json | sponge "$HOME"/.cursor/settings.json

#
jq '."workbench.colorTheme" |= "Cursor Light"' "$HOME"/.cursor/settings.json | sponge "$HOME"/.cursor/settings.json
jq '."workbench.colorTheme" |= "Default Light Modern"' "$HOME"/.cursor/settings.json | sponge "$HOME"/.cursor/settings.json
```
