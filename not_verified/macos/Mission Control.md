# Mission Control

## Disable auto-switching desktop

```sh
defaults write com.apple.dock workspaces-auto-swoosh -bool NO
```

```sh
defaults write com.apple.dock workspaces-auto-swoosh -bool YES
```

## Restart

```sh
killall -HUP Dock
```
