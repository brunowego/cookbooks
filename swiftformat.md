# SwiftFormat

## Links

- [Code Repository](https://github.com/nicklockwood/SwiftFormat)

## CLI

### Installation

#### Homebrew

```sh
brew install swiftformat
```

### Commands

```sh
swiftformat --help
```

### Usage

```sh
#
swiftformat .
```

### Tips

#### Visual Studio Code

```sh
#
code --install-extension vknabel.vscode-swiftformat

#
jq '."recommendations" += ["vknabel.vscode-swiftformat"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
