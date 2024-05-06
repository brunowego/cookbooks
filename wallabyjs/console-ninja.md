# Console Ninja

<!--
https://github.com/wallabyjs/console-ninja/issues/36
https://github.com/wallabyjs/console-ninja/issues/127
-->

## Links

- [Main Website](https://console-ninja.com)

## Tips

### Visual Studio Code

```sh
#
code --install-extension WallabyJs.console-ninja

#
jq '."recommendations" += ["WallabyJs.console-ninja"]' "$HOME"/.vscode/extensions.json | sponge "$HOME"/.vscode/extensions.json
```

**Configuration:**

```sh
#
jq '."console-ninja.featureSet" |= "Community"' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
```
