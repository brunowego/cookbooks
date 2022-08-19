# JavaScript Object Notation (JSON)

## Links

- [JSON Formatter](https://jsonformatter.org/)

## Tips

### Visual Studio Code

```sh
#
code --install-extension esbenp.prettier-vscode

#
jq '."[json]"."editor.defaultFormatter" |= "esbenp.prettier-vscode"' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```
