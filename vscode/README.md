# Visual Studio Code (a.k.a. VS Code)

<!--
https://github.com/search?q=filename%3Asettings.json+path%3A.vscode
-->

<!--
https://code.visualstudio.com/docs/remote/ssh
https://github.com/datalayer-examples/vscode-extension-examples
-->

## Links

- [Code Repository](https://github.com/microsoft/vscode)
- [Main Website](https://vscode.dev/)

## Guide

- [Debugging](https://code.visualstudio.com/docs/editor/debugging)
- [Performance Issues](https://github.com/Microsoft/vscode/wiki/Performance-Issues)

## App

### Dependencies

- [cURL](/curl.md)
- [jq](/jq.md)
- [moreutils](/moreutils.md)
- Ubuntu
  - [Software Properties Common](/apt/software-properties-common.md#installation)

#### APT

```sh
sudo apt update
sudo apt -y install software-properties-common apt-transport-https wget
```

### Installation

#### Homebrew

```sh
brew install --cask visual-studio-code
```

#### APT

```sh
wget -q https://packages.microsoft.com/keys/microsoft.asc -O - | \
  sudo apt-key add -

sudo add-apt-repository 'deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main'
```

```sh
sudo apt update
sudo apt -y install code
```

#### Zypper

```sh
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[vscode]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/zypp/repos.d/vscode.repo'

sudo zypper refresh
sudo zypper --non-interactive install code
```

#### Chocolatey

```sh
choco install -y vscode
```

### Configuration

```sh
# Darwin
mkdir -p "$HOME"/.vscode

ln -s "$HOME"/Library/Application\ Support/Code/User/settings.json "$HOME"/.vscode/settings.json
```

## CLI

<!--
ln -s /Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code /usr/local/bin/code
-->

### Installation

Comes with application installation.

### Commands

```sh
code -h
```

### Settings

```sh
# Locally
cat ./.vscode/settings.json

# Globally
cat "$HOME"/.vscode/settings.json
```

### Usage

```sh
# Show status
code -s

# Open without extensions
code ./ --disable-extensions

#
code ./<filename>

# Open current
code ./

# List installed
code --list-extensions

# Install extension
code --install-extension <extension>

# Disable
code --disable-extension <extension>

# Disable GPU
code --disable-gpu

# Uninstall
code --uninstall-extension <extension>
```

### Tips

#### Debug Output

**Shortcut:** `Shift (⇧) + Command (⌘) + U`

1. View -> Output
2. Clear Output (`Command (⌘) + Shift (⇧) + P` -> `View: Clear Output`)
3. File -> Save (`Command (⌘) + S`)

#### All Extensions

```sh
# Upgrade
code --list-extensions | while read extension; do
  code --install-extension "$extension" --force
done

# Disable
code --list-extensions | while read extension; do
  code --disable-extension "$extension" --force
done

# Uninstall
code --list-extensions | while read extension; do
  code --uninstall-extension "$extension" --force
done
```

#### Unsaved Files

```sh
# Darwin
cat ~/Library/Application\ Support/Code/Backups
```

#### Proxy

```sh
# Add
jq '."http.proxy" |= "'$http_proxy'"' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
jq '."http.proxyAuthorization" |= "null"' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json

# Delete
jq 'del(."http.proxy")' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
jq 'del(."http.proxyAuthorization")' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
```

#### Command-line completion

```sh
# Using Oh My Zsh
sed -ri 's/^plugins=\((.*)\)/plugins=\(\1 vscode\)/g' ~/.zshrc

source ~/.zshrc

rm ~/.zcompdump*
```

#### Close from CLI

```sh
# Darwin
osascript -e 'quit app "Visual Studio Code"'
```

#### Shortcuts

- `⌘` Command
- `⇧` Shift
- `⌥` Option
- `⌃` Control
- `↩︎` Return/Enter

- `Ctrl + Shift + l` Delete line

### Issues

#### TBD

```log
The character U+2019 "’" could be confused with the character U+0060 "`", which is more common in source code. Adjust settings
```

TODO

#### Import Failed

```log
error: https://packages.microsoft.com/keys/microsoft.asc: import read failed(2).
```

Install [cURL](/curl.md).
