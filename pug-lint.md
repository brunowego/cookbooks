# pug-lint

## CLI

### Tips

#### Visual Studio Code

```sh
code --install-extension mrmlnc.vscode-puglint
```

```sh
jq '."puglint.enable" |= true' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```
