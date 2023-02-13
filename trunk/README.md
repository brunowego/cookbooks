# Trunk

## Links

- [Org. Repository](https://github.com/trunk-io)
- [Main Website](https://trunk.io)
- [Docs](https://docs.trunk.io/docs)

## CLI

### Installation

#### Homebrew

```sh
brew install --cask trunk-io
```

#### Unix-like

```sh
curl -fsSL 'https://get.trunk.io' | bash -s -- -y
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

#
trunk upgrade
```

### Configuration

```sh
#
trunk config print

trunk config share
trunk config hide
```

### Usage

```sh
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
trunk cache clean

#
trunk daemon
```

### Tips

#### Actions

```sh
#
trunk actions list

#
trunk actions run <name>

#
trunk actions enable <name>

# Must have
trunk actions enable trunk-cache-prune trunk-check-pre-push trunk-fmt-pre-commit
```

#### Git Hooks

```sh
#
trunk git-hooks sync

#
git config --get core.hookspath

#
git config --unset core.hooksPath
```

#### Visual Studio Code

**Requirements:** Remove [Linter](/linter.md) extension.

```sh
#
code --install-extension Trunk.io

#
jq '."recommendations" += ["Trunk.io"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

### Issues

#### OS Incompatibility with hadolint

```log
[1]    10038 segmentation fault  ~/.cache/trunk/tools/hadolint/2.12.0-*/hadolint -v
```

```sh
#
rm -fR ~/.cache/trunk/tools/hadolint

#
trunk install

#
rm ~/.cache/trunk/tools/hadolint/2.12.0-*/hadolint

#
cp $(brew --prefix hadolint)/bin/hadolint ~/.cache/trunk/tools/hadolint/2.12.0-*/
```
