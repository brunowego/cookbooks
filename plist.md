# Property List (plist)

## Tips

### Visual Studio Code

```sh
#
code --install-extension dnicolson.binary-plist

#
jq '."recommendations" += ["dnicolson.binary-plist"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json

#
jq '."files.associations"."*.strings" |= "plist"' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
```
