# pug-lint

## CLI

### Tips

#### Visual Studio Code

```sh
#
code --install-extension mrmlnc.vscode-puglint

#
jq '."recommendations" += ["mrmlnc.vscode-puglint"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

```sh
jq '."puglint.enable" |= true' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
```
