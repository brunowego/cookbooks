# Visual Studio Code Colorize

## Links

- [Code Repository](https://github.com/kamikillerto/vscode-colorize)

## Extension

### Installation

```sh
#
code --install-extension kamikillerto.vscode-colorize

#
jq '."recommendations" += ["kamikillerto.vscode-colorize"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

**Configuration:**

```sh
#
jq '."colorize.languages" += ["typescript"]' "$HOME"/.vscode/extensions.json | sponge "$HOME"/.vscode/extensions.json

jq '."colorize.languages" += ["typescriptreact"]' "$HOME"/.vscode/extensions.json | sponge "$HOME"/.vscode/extensions.json
```
