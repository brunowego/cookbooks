# SketchUp

## App

### Installation

#### DMG

```sh
#
hdiutil attach https://www.sketchup.com/sketchup/SketchUpPro-dmg /
  -nobrowse /
  -mountpoint /Volumes/SketchUpPro

#
cp -R /Volumes/SketchUpPro/SketchUp\ 2021 /Applications

#
hdiutil detach /Volumes/SketchUpPro
```
