# Transmission

## App

### Installation

#### DMG

```sh
hdiutil attach 'https://github.com/transmission/transmission-releases/raw/master/Transmission-2.94.dmg' -nobrowse -mountpoint /Volumes/Transmission
```

```sh
cp -R /Volumes/Transmission/Transmission.app /Applications
```

```sh
hdiutil detach /Volumes/Transmission
```
