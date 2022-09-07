# JavaScript Object Notation (JSON)

## Links

- [JSON Formatter](https://jsonformatter.org/)

## Tips

### Visual Studio Code

**Note:** Not necessary.

```sh
#
code --install-extension esbenp.prettier-vscode

#
jq '."[json]"."editor.defaultFormatter" |= "esbenp.prettier-vscode"' "$PWD"/.vscode/settings.json | sponge "$PWD"/.vscode/settings.json
```
