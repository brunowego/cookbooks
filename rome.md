# Rome

## Links

- [Code Repository](https://github.com/rome/tools)
- [Main Website](https://rome.tools)
- [Docs](https://docs.rome.tools)

## CLI

### Commands

```sh
npx rome -h
```

### Configuration

<!--
{
  "javascript": {
    "formatter": {
      "semicolons": "asNeeded",
      "quoteStyle": "single"
    }
  },
  "formatter": {
    "enabled": true,
    "indentStyle": "space",
    "indentSize": 2,
    "lineWidth": 100
  },
  "linter": {
    "enabled": true,
    "rules": {
      "recommended": true
    }
  }
}
-->

### Tips

#### Visual Studio Code

```sh
#
code --install-extension rome.rome

#
jq '."recommendations" += ["rome.rome"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
