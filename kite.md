# Kite

**Keywords**: Code Completion

## App

### Installation

#### Homebrew

```sh
brew cask install kite
```

### Tips

#### Visual Studio Code

```sh
code --install-extension kiteco.kite
```

```sh
jq '."kite.showWelcomeNotificationOnStartup" |= false' "$HOME/.config/Code/User/settings.json" | sponge "$HOME/.config/Code/User/settings.json"
```

```sh
# Darwin
osascript -e 'quit app "Visual Studio Code"'

code --disable-extension kiteco.kite
```
