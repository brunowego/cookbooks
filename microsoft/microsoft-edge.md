# Microsoft Edge

## App

### Installation

#### Homebrew

```sh
brew install --cask microsoft-edge

#
brew install --cask microsoft-edge-dev
```

### Uninstall

```sh
# Homebrew
brew uninstall --cask microsoft-edge

#
brew uninstall --cask microsoft-edge-dev
```

### Purge

```sh
# Darwin
rm -fR ~/Library/Application\ Support/Microsoft\ Edge\ Dev
rm -fR ~/Library/Caches/Microsoft\ Edge\ Dev/
rm -fR ~/Library/Saved\ Application\ State/com.microsoft.edgemac.Dev.savedState
rm -fR ~/Library/WebKit/com.microsoft.edgemac.Dev
rm -fR ~/Library/Preferences/com.microsoft.edgemac.Dev.plist
```
