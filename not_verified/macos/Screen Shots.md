# Screen Shots

## Shadow

### Disabled

```sh
defaults write com.apple.screencapture disable-shadow -bool true
```

### Enable

```sh
defaults write com.apple.screencapture disable-shadow -bool false
```

## Restart

```sh
killall -HUP SystemUIServer
```
