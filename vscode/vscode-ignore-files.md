# Visual Studio Code Remote Development

## Extension

### Installation

```sh
#
code --install-extension ldez.ignore-files

#
jq '."recommendations" += ["ldez.ignore-files"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
