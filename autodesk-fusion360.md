# Autodesk Fusion 360

<!--
https://app.pluralsight.com/paths/skill/fusion-360-core-skills

https://www.linkedin.com/learning/fusion-360-essential-training-2/use-fusion-360-to-turn-your-ideas-into-designs
https://www.linkedin.com/learning/learning-fusion-360-3/getting-started-with-fusion-360
https://www.linkedin.com/learning/fusion-360-tips-tricks-and-techniques/welcome
https://www.linkedin.com/learning/introduction-to-geometric-dimensioning-and-tolerancing/faster-cheaper-better-parts
-->

## App

### Installation

#### Homebrew

```sh
brew install --cask autodesk-fusion360
```

### Tips

#### Insert Mesh

1. Insert -> Insert Mesh
2. Select STL file

#### Disable Design History

1. Right Click in Component
2. Click: Do not capture Design History
3. Pop up: Click in Continue

#### Mesh to BRep

1. Open Component Bodies
2. Right Click in MeshBody1 -> Click in Mesh to BRep
3. Pop up: Click in OK

### Issues

<!-- ####

```log
Warning: The selected DXF file does not contain units information. The design's units will be used. You can change this with the Units dropdown.
```

TODO -->

<!-- ####

```log
Error: The selected DXF file contains some unsupported geometry, such as 3D objects. Insert DXF has only inserted layers containing supported 2D geometry. To import a DXF with 3D geometry, use Upload in the Data Panel.

The selected DXF file does not contain units information. The design's units will be used. You can change this with the Units dropdown.
```

TODO -->
