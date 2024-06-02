# JavaScript Object Notation (JSON)

## Tools

- [JSON Crack](https://jsoncrack.com) 🌟
- [JSON Formatter](https://jsonformatter.org)
- [JSON Schema Store](https://schemastore.org/json)

<!--
https://chrome.google.com/webstore/detail/json-viewer/efknglbfhoddmmfabeihlemgekhhnabb?hl=pt
-->

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
