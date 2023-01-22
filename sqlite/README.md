# SQLite

## Links

- [Main Website](https://sqlite.org)

## Library

### Installation

#### APT

```sh
sudo apt update
sudo apt -y install libsqlite3-dev
```

#### APK

```sh
sudo apk update
sudo apk add sqlite-dev
```

## CLI

### Installation

#### Homebrew

```sh
brew install sqlite
```

#### YUM

```sh
yum check-update
sudo yum -y install sqlite
```

#### Chocolatey

```sh
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
