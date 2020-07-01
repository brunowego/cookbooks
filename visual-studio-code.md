# Visual Studio Code

## App

### Dependencies

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
.settings
.vscode
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
