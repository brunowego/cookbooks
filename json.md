# JavaScript Object Notation (JSON)

## Tools

- [JSON Formatter](https://jsonformatter.org/)
- [JSON Schema Store](https://schemastore.org/json/)

## Container

- Binary-JSON (BJSON)
- MessagePack
- Plaintext

## Specification

- JSON:API

## Tips

### Visual Studio Code

**Dependencies:** [Prettier](/prettier.md#visual-studio-code)

```sh
#
jq '."[json]"."editor.defaultFormatter" |= "esbenp.prettier-vscode"' "$PWD"/.vscode/settings.json | sponge "$PWD"/.vscode/settings.json
```
