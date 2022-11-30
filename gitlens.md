# GitLens

## Links

- [Code Repository](https://github.com/gitkraken/vscode-gitlens)
- [Main Website](https://gitlens.amod.io/)

## Tips

### Visual Studio Code

```sh
#
code --install-extension eamodio.gitlens

#
jq '."recommendations" += ["eamodio.gitlens"]' "$HOME"/.vscode/extensions.json | sponge "$HOME"/.vscode/extensions.json

#
jq '."gitlens.codeLens.recentChange.enabled" |= false' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json

jq '."gitlens.codeLens.authors.enabled" |= false' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
```
