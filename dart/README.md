# Dart

## Links

- [Org. Repository](https://github.com/dart-lang)
- [Main Website](https://dart.dev)

## CLI

### Installation

#### Homebrew

```sh
brew tap dart-lang/dart
brew install dart
```

### Commands

```sh
dart -h
```

### Usage

```sh
#
dart analyze ./
```

### Tips

#### Visual Studio Code

**Dependencies:** [Linter](/linter.md#visual-studio-code) and [Prettier](/prettier.md#visual-studio-code)

```sh
#
code --install-extension Dart-Code.dart-code

#
jq '."recommendations" += ["Dart-Code.dart-code"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
