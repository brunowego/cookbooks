# PostgreSQL for Visual Studio Code

## Links

- [Code Repository](https://github.com/microsoft/vscode-pgsql)
- [Marketplace](https://marketplace.visualstudio.com/items?itemName=ms-ossdata.vscode-pgsql)

## Installation

```sh
#
code --install-extension ms-ossdata.vscode-pgsql

#
jq '."recommendations" += ["ms-ossdata.vscode-pgsql"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
