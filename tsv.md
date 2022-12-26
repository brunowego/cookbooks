# Tab-Separated Values (TSV)

## Tips

### Visual Studio Code

```sh
#
code --install-extension mechatroner.rainbow-csv

#
jq '."recommendations" += ["mechatroner.rainbow-csv"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
