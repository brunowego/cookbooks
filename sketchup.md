# SketchUp

## App

### Installation

#### DMG

```sh
#
hdiutil attach 'https://sketchup.com/sketchup/SketchUpPro-dmg' \
  -nobrowse \
  -mountpoint /Volumes/SketchUpPro

#
cp -R /Volumes/SketchUpPro/SketchUp\ 2022 /Applications

#
hdiutil detach /Volumes/SketchUpPro
```
