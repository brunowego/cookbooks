# Thunder Client

## Links

- [Code Repository](https://github.com/rangav/thunder-client-support)

## Tips

### Visual Studio Code

```sh
#
code --install-extension rangav.vscode-thunder-client

#
jq '."recommendations" += ["rangav.vscode-thunder-client"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
