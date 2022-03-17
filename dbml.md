# Database Markup Language (DBML)

## Links

- [Code Repository](https://github.com/holistics/dbml)
- [Main Website](https://dbml.org/)

## Tips

### Visual Studio Code

```sh
#
code --install-extension matt-meyers.vscode-dbml

#
jq '."recommendations" += ["matt-meyers.vscode-dbml"]' "$PWD/.vscode/extensions.json" | sponge "$PWD/.vscode/extensions.json"
```
