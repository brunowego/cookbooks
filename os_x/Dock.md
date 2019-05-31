# Dock

## Auto hide

```sh
defaults write com.apple.dock autohide -bool true
```

## Persistent

### Apps

```sh
defaults delete com.apple.dock persistent-apps
```

### Others

```sh
defaults delete com.apple.dock persistent-others
```

### Recent

```sh
defaults delete com.apple.dock recent-apps
```

## Restart

```sh
killall -HUP Dock
```
