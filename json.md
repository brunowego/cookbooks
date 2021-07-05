# JavaScript Object Notation (JSON)

## Links

- [JSON Formatter](https://jsonformatter.org/)

## Tips

### Visual Studio Code

```sh
code --install-extension HookyQR.beautify
```

```sh
jq '."[json]"."editor.defaultFormatter" |= "HookyQR.beautify"' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```
