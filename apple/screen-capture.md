# Apple ScreenCapture

## Configuration

```sh
#
defaults read com.apple.screencapture

#
defaults write com.apple.screencapture location -string "${HOME}/Pictures"
defaults read com.apple.screencapture location

#
defaults write com.apple.screencapture type -string 'jpg'
defaults read com.apple.screencapture type
```
