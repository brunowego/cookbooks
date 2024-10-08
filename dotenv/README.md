# dotENV

<!--
DB_USERNAME filetype:env
-->

## Tools

- [direnv](/direnv.md) 🌟
- [dotenv-cli](/dotenv/cli.md)
- [envo](/envo.md)
- [Dotenv / Vault](https://vault.dotenv.org)

## Configuration

```sh
#
echo '/.env*.local' >> ./.gitignore

#
# .env
# .env.development
# .env.production

#
# .env.local
```

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

**Configuration:**

```sh
#
jq '."files.associations"."*.env*" |= "properties"' "$PWD"/.vscode/settings.json | sponge "$PWD"/.vscode/settings.json
```
