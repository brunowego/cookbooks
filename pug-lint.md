# pug-lint

## CLI

### Tips

#### Visual Studio Code

```sh
code --install-extension mrmlnc.vscode-puglint
```

```sh
jq '."puglint.enable" |= true' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
```
