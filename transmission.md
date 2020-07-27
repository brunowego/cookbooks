# Transmission

## App

### Installation

#### DMG

```sh
TRANSMISSION_LATEST_VERSION="$(curl -s https://api.github.com/repos/transmission/transmission/releases/latest | grep tag_name | cut -d '"' -f 4)"; \
  hdiutil attach "https://github.com/transmission/transmission-releases/raw/master/Transmission-${TRANSMISSION_LATEST_VERSION}.dmg" -nobrowse -mountpoint /Volumes/Transmission
```

```sh
cp -R /Volumes/Transmission/Transmission.app /Applications
```

```sh
hdiutil detach /Volumes/Transmission
```
