# Ultimaker Cura

## App

### Installation

#### Homebrew

```sh
brew install --cask ultimaker-cura
```

#### Chocolatey

```sh
choco install cura-new
```

### Plugins

- Arc Welder
- Cylindric Custom Support
- Mesh Tools

### Configuration

#### Creality Ender 3 v2

1. Settings -> Printer -> Add Printer
2. Add a non-networked printer
3. Creality3D -> Choose "Creality Ender-3"
   - Change "Printer Name" to "Creality Ender-3 v2"
   - Click Next
4. Machine Settings
   - Printer Tab
     - X (Width): 220
     - Y (Depth): 220
     - Next

#### Parameters

| Section              | Parameter                  | Value         |
| -------------------- | -------------------------- | ------------- |
| Build Plate Adhesion | Build Plate Adhesion Type  | None or Brim  |
| Build Plate Adhesion | Brim Line Count            | 10            |
| Infill               | Infill Density             | +20%          |
| Quality              | Layer Height               | 0.16          |
| Shell                | Wall Line Count            | 4             |
| Special Modes        | Arc Welder                 | Yes           |
| Special Modes        | Print Sequence             | One at a Time |
| Speed                | Print Speed                | 35.0 mm/s     |
| Support              | Generate Support           | Yes           |
| Top/Bottom           | Monotonic Top/Bottom Order | Yes           |

### Tips

#### Turn off model snapping to build platform

1. Preferences -> Configure Cura...
2. General Tab
3. Viewport behavior
   - Uncheck: Automatically drop models to the build plate
   - Close

#### Mesh Tools

1. Right Click on Object
2. Mesh Tools -> Split models into parts

#### BLTouch

1. Settings -> Printer -> Manage Printers...
2. Printers -> Machine Settings
3. Start G-code

```txt
...
G28 ; Home all axes
M420 S1 Z2 ; Enable ABL
G1 Z2.0 F3000 ; Move Z Axis up little to prevent scratching of Heat Bed
...
```

#### Keep Out Area

**Refer:** `/Applications/Ultimaker-Cura.app/Contents/Resources/share/cura/resources/definitions/creality_ender3.def.json`

```json
{
  // ...
  "overrides": {
    "machine_disallowed_areas": {
      "default_value": []
    }
  }
  // ...
}
```

<!-- #### Skirt

adhesion -->
