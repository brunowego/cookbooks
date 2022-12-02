# Mission Control

## Shortcuts

- Show Desktop: `Fn` + `F11` or `Command` + `F3`

## Configuration

```sh
# Disable auto-switching desktop
defaults write com.apple.dock workspaces-auto-swoosh -bool NO
defaults write com.apple.dock workspaces-auto-swoosh -bool YES
```

## Tips

### Restart Dock

```sh
killall -HUP Dock
```
