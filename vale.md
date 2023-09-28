# Vale

## Links

- [Code Repository](https://github.com/errata-ai/vale)
- [Main Website](https://vale.sh)
- [Config Generator](https://vale.sh/generator)

## Related

- [Prose Linters](/prose.md#linters)

## CLI

### Installation

#### Homebrew

```sh
brew install vale
```

#### Chocolatey

```sh
choco install vale
```

### Configuration

```sh
#
cat << EOF > ./.vale.ini
StylesPath = styles

MinAlertLevel = suggestion

Packages = Google, proselint

[*]
BasedOnStyles = Vale, Google, proselint
EOF

#
vale sync
```

### Commands

```sh
vale -h
```

<!-- ### Usage

```sh
#
vale
``` -->

### Tips

#### Visual Studio Code

```sh
#
code --install-extension errata-ai.vale-server

#
jq '."recommendations" += ["errata-ai.vale-server"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
