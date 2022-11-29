# JSDoc

## Docs

### Visual Studio Code

```sh
#
code --install-extension lllllllqw.jsdoc

#
jq '."recommendations" += ["lllllllqw.jsdoc"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

```sh
# Darwin
osascript -e 'quit app "Visual Studio Code"'

code --disable-extension lllllllqw.jsdoc
```
