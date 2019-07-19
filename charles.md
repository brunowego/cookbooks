# Charles

## Installation

### Homebrew

```sh
brew cask install charles
```

## Tips

### Add CLI

```sh
ln -s /Applications/Charles.app/Contents/MacOS/Charles /usr/local/bin/charles
```

### Dock

```sh
# hidden
/usr/libexec/PlistBuddy -c 'Add :LSUIElement bool true' /Applications/Charles.app/Contents/Info.plist

# show
/usr/libexec/PlistBuddy -c 'Delete :LSUIElement' /Applications/Charles.app/Contents/Info.plist
```
