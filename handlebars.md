# Handlebars

## Links

- [Main Website](https://handlebarsjs.com)

## Tips

### Visual Studio Code

**Dependencies:** Code format with [Prettier](/prettier.md#visual-studio-code)

```sh
#
code --install-extension ItsMeAdarsh.vsc-handlebars-ext

#
jq '."recommendations" += ["ItsMeAdarsh.vsc-handlebars-ext"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

**Configuration:**

```sh
#
jq '."[handlebars]"."editor.formatOnSave" |= false' "$PWD"/.vscode/settings.json | sponge "$PWD"/.vscode/settings.json
```
