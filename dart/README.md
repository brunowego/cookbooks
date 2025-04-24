# Dart

## Links

- [Org. Repository](https://github.com/dart-lang)
- [Main Website](https://dart.dev)

## CLI

### Installation

```sh
# Using Homebrew
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
dart analyze

#
dart format ./
```

### Tips

#### Visual Studio Code

**Dependencies:** [Prettier](/prettier.md#visual-studio-code)

```sh
#
code --install-extension Dart-Code.dart-code

#
jq '."recommendations" += ["Dart-Code.dart-code"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
