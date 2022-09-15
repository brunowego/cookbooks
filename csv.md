# Comma-separated values (CSV)

## Tools

- [CSV Lint](https://csvlint.com/online-validator)

## Tips

### Visual Studio Code

```sh
#
code --install-extension mechatroner.rainbow-csv

#
jq '."recommendations" += ["mechatroner.rainbow-csv"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
