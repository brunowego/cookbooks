# Rome

<!--
Rome is designed to replace Babel, ESLint, webpack, Prettier, Jest, and others.
-->

## Links

- [Code Repository](https://github.com/rome/tools)
- [Main Website](https://rome.tools)
- [Docs](https://docs.rome.tools)

## Library

### Installation

```sh
# Using pnpm
pnpm add rome -D
```

### Configuration

```json
{
  // ...
  "scripts": {
    "lint": "rome check",
    "format": "rome format"
  }
}
```

<!--
pnpm rome check . --apply-suggested
pnpm rome format . --write
-->

## CLI

### Commands

```sh
npx rome -h
```

### Initialize

```sh
#
npx rome init
```

#### Configuration

**Refer:** `./rome.json`

```json
{
  // ...
  "formatter": {
    "enabled": true,
    "indentStyle": "space",
    "indentSize": 2,
    "lineWidth": 100
  }
  // "linter": { ... }
}
```

```json
{
  // ...
  "javascript": {
    "formatter": {
      "semicolons": "asNeeded",
      "quoteStyle": "single"
    }
  }
}
```

### Tips

#### Visual Studio Code

```sh
#
code --install-extension rome.rome

#
jq '."recommendations" += ["rome.rome"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

**Configuration:**

```sh
#
echo '{}' > "$PWD"/.vscode/settings.json
```

```sh
#
jq '."editor.formatOnSave" |= true' "$PWD"/.vscode/settings.json | sponge "$PWD"/.vscode/settings.json

#
jq '."editor.defaultFormatter" |= "rome.rome"' "$PWD"/.vscode/settings.json | sponge "$PWD"/.vscode/settings.json
```
