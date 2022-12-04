# Kite

**Keywords:** Code Completion

## App

### Installation

#### Homebrew

```sh
brew install --cask kite
```

### Tips

#### Visual Studio Code

```sh
#
code --install-extension kiteco.kite

#
jq '."recommendations" += ["kiteco.kite"]' "$PWD"/.vscode/extensions.json | sponge "$PWD"/.vscode/extensions.json
```

**Configuration:**

```sh
jq '."kite.showWelcomeNotificationOnStartup" |= false' "$HOME"/.vscode/settings.json | sponge "$HOME"/.vscode/settings.json
```

```sh
# Darwin
osascript -e 'quit app "Visual Studio Code"'

code --disable-extension kiteco.kite
```
