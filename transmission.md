# Transmission

## Installation

### DMG

```sh
hdiutil attach https://github.com/transmission/transmission-releases/raw/master/Transmission-2.94.dmg -nobrowse -mountpoint /Volumes/Transmission
cp -R /Volumes/Transmission/Transmission.app /Applications
hdiutil detach /Volumes/Transmission
```
