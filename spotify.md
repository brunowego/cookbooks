# macOS

## Installation

### Homebrew

```sh
brew cask install spotify
```

### Chocolatey

```sh
choco install -y spotify
```

## Tips

### Homebrew

#### Hide Dock Icon

```sh
vim /Applications/Spotify.app/Contents/Info.plist
```

Add before last `</dict>`:

```plist
<key>LSUIElement</key>
<true/>
```

## Uninstall

### Homebrew

```sh
brew cask uninstall spotify
```

```sh
rm -fR ~/Library/Application\ Support/Spotify
```
