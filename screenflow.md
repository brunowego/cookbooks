# ScreenFlow

## App

### References

- [Version History](http://www.telestream.net/screenflow/versions.htm)

### Installation

#### Homebrew

```sh
brew install --cask screenflow # v10.x
```

#### DMG

##### Version 8.x

```sh
yes | \
  hdiutil attach 'http://www.telestream.net/download-files/screenflow/8-2/ScreenFlow-8.2.6.dmg' \
    -nobrowse \
    -mountpoint /Volumes/ScreenFlow \
      >/dev/null

#
cp -R /Volumes/ScreenFlow/ScreenFlow.app /Applications

#
hdiutil detach /Volumes/ScreenFlow
```
