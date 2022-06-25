# Pine

## Links

- [Main Website](https://pinecoders.com/)

## Tips

### Visual Studio Code

```sh
#
code --install-extension ex-codes.pine-script-syntax-highlighter

#
jq '."recommendations" += ["ex-codes.pine-script-syntax-highlighter"]' "$PWD/.vscode/extensions.json" | sponge "$PWD/.vscode/extensions.json"
```
