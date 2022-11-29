# protolint

<!--
https://github.com/yoheimuta/protolint/blob/master/_example/config/.protolint.yaml
-->

## Links

- [Code Repository](https://github.com/yoheimuta/protolint)
- [Rules](https://github.com/yoheimuta/protolint#rules)

## CLI

### Installation

#### Homebrew

```sh
brew tap yoheimuta/protolint
brew install protolint
```

### Commands

```sh
protolint
```

### Configuration

```sh
cat << EOF > ./.protolint.yaml
lint:
  rules_option:
    max_line_length:
      max_chars: 120
      tab_chars: 2
EOF
```

### Usage

```sh
#
protolint list

#
protolint lint
```

### Tips

#### Visual Studio Code

```sh
#
code --install-extension plex.vscode-protolint

#
jq '."recommendations" += ["plex.vscode-protolint"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
