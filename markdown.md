# Markdown

## Links

- [Basic Syntax](https://markdownguide.org/basic-syntax/)

## Syntax

### Effects

- ~~Strikethrough~~

### Tips

#### Visual Studio Code

**Recommended:** [markdownlint](/markdownlint.md#visual-studio-code)

```sh
#
code --install-extension shuworks.vscode-table-formatter

#
jq '."recommendations" += ["shuworks.vscode-table-formatter"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
