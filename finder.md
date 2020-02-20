# Finder

<!--
https://appletoolbox.com/how-to-install-update-ios-and-ipados-using-finder-and-macos-catalina/
-->

## Tips

### Save to disk (not to iCloud) by default

```sh
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
```

### Show path bar

```sh
defaults write com.apple.finder ShowPathbar -bool true
```

### Show extensions

```sh
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
```

### Show hidden files

```sh
defaults write com.apple.finder AppleShowAllFiles true
```

### Group by

```sh
defaults write com.apple.finder FXPreferredViewStyle -string 'Clmv'
defaults write com.apple.Finder FXPreferredGroupBy 'Name'
defaults write com.apple.Finder FXArrangeGroupViewBy 'Name'
```

### Restart

```sh
killall -HUP Finder
```
