# Spyder

## App

### Installation

#### DMG

```sh
hdiutil attach 'https://github.com/spyder-ide/spyder/releases/latest/download/Spyder.dmg' -nobrowse -mountpoint /Volumes/Spyder
```

```sh
cp -R /Volumes/Spyder/Spyder.app /Applications
```

```sh
hdiutil detach /Volumes/Spyder
```
