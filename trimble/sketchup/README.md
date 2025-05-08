# SketchUp

<!--
https://www.youtube.com/watch?v=hGOUc8i-TxA&list=PLEQT0qjXe6zgmMMP6ZzoUDG_fdjcRmCQE
-->

## Links

- [Main Website](https://sketchup.com)
- [3D Warehouse](https://3dwarehouse.sketchup.com)
- [SketchUp Online](https://app.sketchup.com/app)

<!--
https://xr.sketchup.com
-->

## App

### Installation

```sh
# DMG
hdiutil attach 'https://sketchup.com/sketchup/SketchUpPro-dmg' \
  -nobrowse \
  -mountpoint /Volumes/SketchUpPro

ls /Volumes/SketchUpPro

cp -R /Volumes/SketchUpPro/SketchUp\ 2025 /Applications

hdiutil detach /Volumes/SketchUpPro
```
