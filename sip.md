# Sip

<!--
https://sipapp.io/updates/#2.5.4
-->

## Links

- [Main Website](https://sipapp.io)

## App

### Installation

#### Homebrew

```sh
brew install --cask sip
```

#### DMG

##### v2.5.4

```sh
#
hdiutil attach https://sipapp.fra1.digitaloceanspaces.com/updates/v2/sip-2.5.4.dmg \
  -nobrowse \
  -mountpoint /Volumes/Sip

#
cp -R /Volumes/Sip/Sip.app /Applications

#
hdiutil detach /Volumes/Sip
```

### Tips

#### Disable Sounds

1. Preferences
2. General Tab
   - Uncheck: Play Sounds

#### Disable Dock

1. Preferences
2. Dock Tab
   - Uncheck: Show color docks
   - Can join all spaces
