# SQLite

<!--
DB Browser for SQLite
SQLiteStudio
-->

## Links

- [Main Website](https://sqlite.org)

## Library

### Installation

```sh
# Using APT
sudo apt update
sudo apt -y install libsqlite3-dev

# Using APK
sudo apk update
sudo apk add sqlite-dev
```

## CLI

### Installation

```sh
# Using Homebrew
brew install sqlite

# Using YUM
yum check-update
sudo yum -y install sqlite

# Using Chocolatey
choco install -y sqlite
```

### Commands

```sh
sqlite3 -help
```

<!-- ### Usage

```sh

``` -->

### Tips

#### Visual Studio Code

**Links:** [SQLite Viewer Web App](https://sqliteviewer.app/)

```sh
#
code --install-extension qwtel.sqlite-viewer

#
jq '."recommendations" += ["qwtel.sqlite-viewer"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```
