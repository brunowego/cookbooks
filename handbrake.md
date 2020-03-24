# HandBrake

## App

### Installation

#### DMG

```sh
hdiutil attach https://download.handbrake.fr/releases/1.2.2/HandBrake-1.2.2.dmg -nobrowse -mountpoint /Volumes/HandBrake
```

```sh
cp -R /Volumes/HandBrake/HandBrake.app /Applications
```

```sh
hdiutil detach /Volumes/HandBrake
```
