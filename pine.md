# Pine Script™

## Links

- [Main Website](https://pinecoders.com/)

## Guides

- [Migration Guides / To Pine Script™ version 5](https://www.tradingview.com/pine-script-docs/en/v5/migration_guides/To_Pine_version_5.html)

## Tips

### Visual Studio Code

```sh
#
code --install-extension ex-codes.pine-script-syntax-highlighter

#
jq '."recommendations" += ["ex-codes.pine-script-syntax-highlighter"]' "$PWD/.vscode/extensions.json" | sponge "$PWD/.vscode/extensions.json"
```
