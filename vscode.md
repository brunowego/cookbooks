# Visual Studio Code

<!--
https://code.visualstudio.com/docs/remote/ssh
-->

## App

### Dependencies

- [cURL](/curl.md)
- [jq](/jq.md)
- [moreutils](/moreutils.md)

#### APT

```sh
sudo apt update
sudo apt -y install software-properties-common apt-transport-https wget
```

### Installation

#### Homebrew

```sh
brew cask install visual-studio-code
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
mkdir -p "$HOME/.config/Code/User"
ln -s "$HOME/Library/Application Support/Code/User/settings.json" "$HOME/.config/Code/User/settings.json"

# Git Ignore Global
cat << EOF >> ~/.gitignore_global
/**/.settings
/**/.vscode
EOF
```

### Commands

```sh
code -h
```

### Usage

```sh
# Open current
code .

# List installed
code --list-extensions

# Install extension
code --install-extension [extension]

# Disable
code --disable-extension [extension]
```

### Tips

#### Useful Plugins

```sh
code \
  --install-extension EditorConfig.EditorConfig \
  --install-extension Tyriar.sort-lines \
  --install-extension mkxml.vscode-filesize \
  --install-extension shardulm94.trailing-spaces \
  --install-extension wmaurer.change-case \
  --install-extension ldez.ignore-files \
  --install-extension sainoba.px-to-rem \
  --install-extension ephoton.indent-switcher
```

<!-- #### GlassIt

```sh
code --install-extension s-nlf-fh.glassit
```

TODO -->

#### Spell Checker

```sh
code \
  --install-extension streetsidesoftware.code-spell-checker \
  --install-extension streetsidesoftware.code-spell-checker-portuguese-brazilian
```

```sh
# English
jq '."cSpell.language" |= "en"' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"

# Portuguese
jq '."cSpell.language" |= "en,pt,pt_BR"' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```

#### Command-line completion

```sh
# Using Oh My Zsh
sed -ri 's/^plugins=\((.*)\)/plugins=\(\1 vscode\)/g' ~/.zshrc

source ~/.zshrc

rm ~/.zcompdump*
```

#### Auto Save

```sh
jq '."files.autoSave" |= "afterDelay"' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```

#### Close from CLI

```sh
# Darwin
osascript -e 'quit app "Visual Studio Code"'
```

#### Disable cSpell

```sh
jq '."cSpell.diagnosticLevel" |= "Hint"' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```

#### Material Theme

```sh
# Install
code --install-extension zhuangtongfa.Material-theme

# Apply
jq '."workbench.colorTheme" |= "One Dark Pro"' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```

#### Shortcuts

- `⌘` Command
- `⇧` Shift
- `⌥` Option
- `⌃` Control
- `↩︎` Return/Enter

- `Ctrl + Shift + l` Delete line


### Issues

#### Import Failed

```log
error: https://packages.microsoft.com/keys/microsoft.asc: import read failed(2).
```

Install [cURL](/curl.md).
