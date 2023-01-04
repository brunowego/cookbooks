# Dock

## Auto hide

```sh
defaults write com.apple.dock autohide -bool true
```

## Persistent

```sh
# Apps
defaults delete com.apple.dock persistent-apps

# Others
defaults delete com.apple.dock persistent-others

# Recent
defaults delete com.apple.dock recent-apps
```

## Restart

```sh
killall -KILL Dock
```
