# Visual Studio Code Theme

## Extend

- [Fira Code Font](/fira-code-font.md)

## Material Theme

```sh
# Install
code --install-extension zhuangtongfa.Material-theme

#
jq '."recommendations" += ["zhuangtongfa.Material-theme"]' "$HOME"/.vscode/extensions.json | sponge "$HOME"/.vscode/extensions.json
jq '."workbench.colorTheme" |= "One Dark Pro"' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
```
