# GitHub CodeQL

## Links

- [Main Website](https://codeql.github.com)

## Glossary

- Query Language (QL)

## CLI

### Installation

#### Homebrew

```sh
brew install --cask codeql
```

### Commands

```sh
codeql -h
```

### Tips

#### Visual Studio Code

```sh
#
code --install-extension github.vscode-codeql

#
jq '."recommendations" += ["github.vscode-codeql"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
