# dotENV

<!--
DB_USERNAME filetype:env
-->

## Tools

- [direnv](/direnv.md) 🌟
- [dotenv-cli](/dotenv/dotenv-cli.md)
- [envo](/envo.md)

## Tips

### Load

```sh
#
export $(sed 's/[[:blank:]]//g; /^#/d' ./.env | xargs)
```

### Visual Studio Code

```sh
#
code --install-extension mikestead.dotenv

#
jq '."recommendations" += ["mikestead.dotenv"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
