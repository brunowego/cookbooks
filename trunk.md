# Trunk

## Links

- [Org. Repository](https://github.com/trunk-io)
- [Main Website](https://trunk.io/)

## CLI

### Installation

#### Homebrew

```sh
brew install --cask trunk-io
```

### Commands

```sh
trunk -h
```

### Initialize

```sh
#
trunk init

#
trunk install
```

### Usage

```sh
#
trunk login
trunk whoami

#
trunk config print

#
trunk check

#
trunk fmt

#
trunk merge

#
trunk upgrade

#
trunk plugins add <uri>

#
trunk cache

#
trunk daemon
```

### Tips

#### Visual Studio Code

```sh
#
code --install-extension Trunk.io

#
jq '."recommendations" += ["Trunk.io"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
