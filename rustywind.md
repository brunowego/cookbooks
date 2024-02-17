# RustyWind

## Links

- [Code Repository](https://github.com/avencera/rustywind)

## CLI

### Installation

#### Homebrew

```sh
brew tap avencera/tap
brew install rustywind
```

### Usage

```sh
#
rustywind --dry-run ./

#
rustywind --check-formatted .

#
rustywind --write ./

#
rustywind --dry-run --custom-regex "[\w]+:\s'([^\']+)'" ./
```

### Tips

#### VSCode

```sh
code --install-extension emeraldwalk.RunOnSave
```

**Refer:** `${HOME}/.vscode/settings.json`

```json
{
  // ...
  "emeraldwalk.runonsave": {
    "commands": [
      {
        "match": "\\.tsx$",
        "cmd": "rustywind --write '${file}'"
      }
    ]
  }
}
```
