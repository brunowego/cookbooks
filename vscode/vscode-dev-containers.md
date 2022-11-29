# Visual Studio Code Remote Development

## Links

<!-- - [Code Repository](https://github.com/microsoft/vscode-dev-containers) -->

- [Code Repository](https://github.com/Microsoft/vscode-remote-release)

## Extension

### Installation

```sh
#
code --install-extension ms-vscode-remote.remote-containers

#
jq '."recommendations" += ["ms-vscode-remote.remote-containers"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
