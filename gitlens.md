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
jq '."recommendations" += ["eamodio.gitlens"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
