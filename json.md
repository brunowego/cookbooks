# JavaScript Object Notation (JSON)

## Tools

- [JSON Formatter](https://jsonformatter.org/)
- [JSON Schema Store](https://schemastore.org/json/)

## Tips

### Visual Studio Code

**Dependencies:** [Prettier](/prettier.md#visual-studio-code)

```sh
#
jq '."[json]"."editor.defaultFormatter" |= "esbenp.prettier-vscode"' "$PWD"/.vscode/settings.json | sponge "$PWD"/.vscode/settings.json
```
