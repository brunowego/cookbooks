# dotENV

<!--
DB_USERNAME filetype:env
-->

## Tools

- [dotenv-cli](/dotenv-cli.md)

## Tips

### Load

```sh
#
export $(sed 's/[[:blank:]]//g; /^#/d' ./.env | xargs)
```

### Git ignore

```sh
echo '/.env' >> ~/.gitignore_global
```

### Visual Studio Code

```sh
#
code --install-extension mikestead.dotenv

#
jq '."recommendations" += ["mikestead.dotenv"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
