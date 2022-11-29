# Initialize (INI)

## Tips

### Visual Studio Code

```sh
#
code --install-extension DavidWang.ini-for-vscode

#
jq '."recommendations" += ["DavidWang.ini-for-vscode"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
