# VSCode Performance

## Tips

### Visual Studio Code

```sh
#
code --install-extension wix.vscode-import-cost

#
jq '."recommendations" += ["wix.vscode-import-cost"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
