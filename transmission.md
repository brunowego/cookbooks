# Transmission

<!--
https://github.com/tomMoulard/make-my-server/blob/c3ac8f2e436ac7d8d78789878c470268d4ae685f/docker-compose.yml
-->

**Keywords:** Torrent Client

## Links

- [Main Website](https://transmissionbt.com)

## App

### Installation

#### DMG

```sh
#
TRANSMISSION_LATEST_VERSION="$(curl -s https://api.github.com/repos/transmission/transmission/releases/latest | grep tag_name | cut -d '"' -f 4)"; \
  hdiutil attach "https://github.com/transmission/transmission-releases/raw/master/Transmission-${TRANSMISSION_LATEST_VERSION}.dmg" -nobrowse -mountpoint /Volumes/Transmission

#
cp -R /Volumes/Transmission/Transmission.app /Applications

#
hdiutil detach /Volumes/Transmission
```

#### Chocolatey

```sh
choco install transmission
```

## CLI

### Installation

#### Homebrew

```sh
brew install transmission-cli
```

### Commands

```sh
transmission-remote -h
```
