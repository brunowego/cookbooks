# Apache Avro Tools (a.k.a. avro-tools)

## CLI

### Installation

#### Homebrew

```sh
brew install avro-tools
```

### Commands

```sh
avro-tools
```

### Tips

#### Visual Studio Code

```sh
#
code --install-extension tomaszbartoszewski.avro-tools

#
jq '."recommendations" += ["tomaszbartoszewski.avro-tools"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
