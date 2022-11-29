# Checkov

**Keywords:** SCA, Terraform Security Scanner

## Links

- [Code Repository](https://github.com/bridgecrewio/checkov)
- [Main Website](https://checkov.io)

## CLI

### Installation

#### Homebrew

```sh
brew install checkov
```

### Commands

```sh
checkov -h
```

### Usage

```sh
#
checkov --list

#
checkov --file <./example.tf>
```

### Tips

#### Visual Studio Code

```sh
#
code --install-extension bridgecrew.checkov

#
jq '."recommendations" += ["bridgecrew.checkov"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
