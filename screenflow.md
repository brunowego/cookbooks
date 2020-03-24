# ScreenFlow

## App

### References

- [Version History](http://www.telestream.net/screenflow/versions.htm)

### Installation

#### Homebrew

```sh
brew cask install screenflow
```

#### DMG

```sh
yes | hdiutil attach http://www.telestream.net/download-files/screenflow/8-2/ScreenFlow-8.2.6.dmg -nobrowse -mountpoint /Volumes/ScreenFlow > /dev/null
```

```sh
cp -R /Volumes/ScreenFlow/ScreenFlow.app /Applications
```

```sh
hdiutil detach /Volumes/ScreenFlow
```
