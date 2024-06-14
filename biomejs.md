# Biome

<!--
https://github.com/HazelHook/Hazel/blob/main/biome.json
-->

## Links

- [Code Repository](https://github.com/biomejs/biome)
- [Main Website](https://biomejs.dev)

## Library

### Installation

```sh
# Using Bun
bun add @biomejs/biome -D
```

### Configuration

<!--
    "lint": "biome check .",
    "lint:fix": "biome check . --apply",
-->

**Refer:** `./biome.json`

```json
{
  "$schema": "https://biomejs.dev/schemas/1.8.0/schema.json",
  "organizeImports": {
    "enabled": false
  },
  "linter": {
    "enabled": true,
    "rules": {
      "recommended": true,
      "correctness": {
        "all": false,
        "noUnusedImports": "error",
        "noUnusedVariables": "error",
        "useJsxKeyInIterable": "error"
      },
      "nursery": {
        "useSortedClasses": {
          "level": "warn",
          "options": {
            "functions": ["cva"]
          }
        }
      },
      "style": {
        "recommended": true,
        "useBlockStatements": "error"
      }
    }
  },
  "formatter": {
    "enabled": true,
    "indentStyle": "space"
  },
  "javascript": {
    "formatter": {
      "semicolons": "asNeeded",
      "quoteStyle": "single",
      "jsxQuoteStyle": "single"
    }
  }
}
```

### Tips

#### Visual Studio Code

```sh
#
code --install-extension biomejs.biome

#
jq '."recommendations" += ["biomejs.biome"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
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
jq '."editor.defaultFormatter" |= "biomejs.biome"' "$PWD"/.vscode/settings.json | sponge "$PWD"/.vscode/settings.json
```

## CLI

### Commands

```sh
npx @biomejs/biome -h
```

### Initialization

```sh
npx @biomejs/biome init
```

### Usage

```sh
#
npx @biomejs/biome format ./
npx @biomejs/biome format --write ./

#
npx @biomejs/biome lint ./

#
npx @biomejs/biome check ./
npx @biomejs/biome check --apply ./

#
npx @biomejs/biome ci ./
```
