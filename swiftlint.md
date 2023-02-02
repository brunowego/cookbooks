# SwiftLint

**Keywords:** Swift Linter

## Links

- [Code Repository](https://github.com/realm/SwiftLint)
- [Main Website](https://realm.github.io/SwiftLint/)

## CLI

### Installation

#### Homebrew

```sh
brew install swiftlint
```

### Commands

```sh
swiftlint -h
```

### Configuration

**Refer:** `./.swiftlint.yml`

```yml
---
excluded:
  - Pods
```

### Usage

```sh
#
swiftlint rules

#
swiftlint lint

#
swiftlint analyze
```

### Tips

#### Visual Studio Code

**Dependencies:** [Prettier](/prettier.md#visual-studio-code)

```sh
#
jq '."[swift]"."editor.defaultFormatter" |= "esbenp.prettier-vscode"' "$PWD"/.vscode/settings.json | sponge "$PWD"/.vscode/settings.json
```

### Issues

#### Missing Logs

```log
Error: Could not read compiler invocations
```

```sh
#
xcodebuild -list

#
xcodebuild \
  -workspace ./<workspace-name>.xcworkspace \
  -scheme <scheme-name> \
    > ./xcodebuild.log

#
swiftlint analyze --compiler-log-path ./xcodebuild.log
```
