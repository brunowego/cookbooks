# SketchUp

## Links

- [Main Website](https://sketchup.com)
- [3D Warehouse](https://3dwarehouse.sketchup.com)

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
