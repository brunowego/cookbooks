# Visual Studio Theme

## Extend

- [Fira Code Font](/fira-code-font.md)

## Material Theme

```sh
# Install
code --install-extension zhuangtongfa.Material-theme

# Globally
# jq '."recommendations" += ["zhuangtongfa.Material-theme"]' ""$HOME"/.vscode/extensions.json | sponge "$HOME"/.vscode/extensions.json
jq '."workbench.colorTheme" |= "One Dark Pro"' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json

# Locally
jq '."recommendations" += ["zhuangtongfa.Material-theme"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
jq '."workbench.colorTheme" |= "One Dark Pro"' "$PWD"/.vscode/settings.json | sponge "$PWD"/.vscode/settings.json
```
