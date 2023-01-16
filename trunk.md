# Trunk

## Links

- [Org. Repository](https://github.com/trunk-io)
- [Main Website](https://trunk.io/)
- [Docs](https://docs.trunk.io/docs)

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
trunk login
trunk whoami

#
trunk install
```

### Usage

```sh
#
trunk config print

#
trunk check -a
trunk check -ay

#
trunk fmt

#
trunk merge

#
trunk upgrade

#
trunk plugins add <uri>

#
trunk actions list
trunk actions run <action-name>
trunk actions enable commitlint

#
trunk cache

#
trunk daemon
```

### Tips

#### Git Hooks

```sh
#
trunk git-hooks sync
```

#### Visual Studio Code

**Requirements:** Remove [Linter](/linter.md) extension.

```sh
#
code --install-extension Trunk.io

#
jq '."recommendations" += ["Trunk.io"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
