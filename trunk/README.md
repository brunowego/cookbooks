# Trunk

## Links

- [Org. Repository](https://github.com/trunk-io)
- [Main Website](https://trunk.io)
- [Docs](https://docs.trunk.io/docs)
- [Status Page](https://status.trunk.io)

## Library

### Installation

```sh
# Using NPM
npm install @trunkio/launcher -d

# Using pnpm
pnpm add @trunkio/launcher -D
```

### Configuration

**Refer:** `./package.json`

```json
{
  // ...
  "scripts": {
    // ...
    "lint": "trunk check --ci"
  }
  // ...
}
```

### Tips

#### Visual Studio Code

**Requirements:** Remove [Linter](/linter.md) extension.

```sh
#
code --install-extension Trunk.io

#
jq '."recommendations" += ["Trunk.io"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

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

### Issues

#### Blocked Push

```log
✖ Push blocked by failing hook 'trunk-check-pre-push'
```

TODO

#### Stopped Trunk on VS Code

```log
Trunk: Stopped
```

TODO

#### Missing Dependencies (FAILURES)

```log
Some tools failed to run. You can open the details yaml files for more information.
```

```sh
#
cat ./.trunk/out/*.yaml

#
pnpm install
```

#### OS Incompatibility with hadolint

**Dependencies:** [Haskell Dockerfile Linter (hadolint)](/hadolint.md#cli)

```log
[1]    21954 segmentation fault  ~/.cache/trunk/tools/hadolint/2.12.0-6fb771cd5a9da2dc321dc5681d8188c6/hadolint
```

```sh
# Darwin
rm -fR ~/.cache/trunk/tools/hadolint

trunk install

~/.cache/trunk/tools/hadolint/2.12.0-6fb771cd5a9da2dc321dc5681d8188c6/hadolint -v

rm ~/.cache/trunk/tools/hadolint/2.12.0-6fb771cd5a9da2dc321dc5681d8188c6/hadolint

cp $(brew --prefix hadolint)/bin/hadolint ~/.cache/trunk/tools/hadolint/2.12.0-6fb771cd5a9da2dc321dc5681d8188c6

ps aux | grep trunk
```
