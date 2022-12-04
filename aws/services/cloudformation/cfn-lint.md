# AWS CloudFormation Linter

## Links

- [Code Repository](https://github.com/aws-cloudformation/cfn-lint)

## CLI

### Installation

#### Homebrew

```sh
brew install cfn-lint
```

### Tips

#### Visual Studio Code

```sh
#
code --install-extension kddejong.vscode-cfn-lint

#
jq '."recommendations" += ["kddejong.vscode-cfn-lint"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
