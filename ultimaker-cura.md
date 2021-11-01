# Ultimaker Cura

<!--
https://www.domestika.org/en/courses/833-introduction-to-3d-design-and-printing
https://www.udemy.com/course/impressao-3d-um-guia-passo-a-passo-2020/
https://www.udemy.com/course/3d-printing-through-to-painting/
https://www.udemy.com/course/3d-printing-101-the-ultimate-beginners-guide/
https://www.udemy.com/course/how-to-optimize-3d-prints/
https://linkedin.com/learning/additive-manufacturing-optimizing-3d-prints-2/getting-the-most-out-of-your-3d-printer
https://www.coursera.org/lecture/3d-print-hardware/04-02-04-cura-slicer-basics-WJiS5
-->

## App

### Installation

#### Homebrew

```sh
brew install --cask ultimaker-cura
```

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

<!--
https://www.youtube.com/watch?v=F6BCra3vW_k&t=36s
https://www.youtube.com/watch?v=wbcB9LT40lE
https://www.youtube.com/watch?v=us8YqV-sJkw
https://www.youtube.com/watch?v=Xkr8YFtMgG4
https://www.youtube.com/watch?v=k-inUpjRVLA
https://www.youtube.com/watch?v=FdnV71HYIEw
https://www.youtube.com/watch?v=tvxugQmhrcc
https://www.youtube.com/watch?v=gSySGU-52Lo
https://www.youtube.com/watch?v=XadcyqoQmrw
-->

| Section | Parameter | Value |
| --- | --- | --- |
| Build Plate Adhesion | Build Plate Adhesion Type | None or Brim |
| Build Plate Adhesion | Brim Line Count | 10 |
| Infill | Infill Density | +20% |
| Quality | Layer Height | 0.16 |
| Shell | Wall Line Count | 4 |
| Special Modes | Arc Welder | Yes |
| Special Modes | Print Sequence | One at a Time |
| Speed | Print Speed | 35.0 mm/s |
| Support | Generate Support | Yes |
| Top/Bottom | Monotonic Top/Bottom Order | Yes |

### Tips

#### Turn off model snapping to build platform

1. Preferences
2. General Tab
3. Viewport behavior
   - Uncheck: Automatically drop models to the build plate
   - Close

#### Cylindric Custom Support

1. Marketplace -> Plugins Tab
2. Cylindric Custom Support -> Install
<!-- 3.  -->

#### Mesh Tools

1. Marketplace -> Plugins Tab
2. Mesh Tools -> Install
<!-- 3.  -->

1. Right Click on Object
2. Mesh Tools -> Spit models into parts

#### BLTouch

1. Settings -> Printer -> Manage Printers...
2. Printers -> Machine Settings
3. Start G-code

```txt
...
G28 ;Home
M420 S1 Z2 ;Enable ABL
G1 Z2.0 F3000 ;Move Z Axis up
...
```

#### Keep Out Area

`/Applications/Ultimaker\ Cura.app/Contents/Resources/resources/definitions/creality_ender3.def.json`

```json
{
  // ...
  "overrides": {
    "machine_disallowed_areas": {
      "default_value": []
    },
  }
  // ...
}
```

#### Skirt

adhesion
