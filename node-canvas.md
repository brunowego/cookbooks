# node-canvas

TODO

<!--
https://stackoverflow.com/questions/75840986/unable-to-install-canvas-on-macos-m2
-->

## Library

### Installation

```sh
# Using pnpm
pnpm add canvas
```

### Snippet

```ts
import { createCanvas } from 'canvas'

type MeasureTextProps = {
  text: string
  fontSize: number
  fontWeight?: number
  fontFamily?: string
}

export const measureText = ({
  text,
  fontSize,
  fontWeight = 400,
  fontFamily = 'Poppins',
}: MeasureTextProps) => {
  const canvas = createCanvas(1, 1)
  const ctx = canvas.getContext('2d')

  ctx.font = `${fontWeight} ${fontSize}px ${fontFamily}`

  return ctx.measureText(text)
}
```

```ts
const textWidth = Math.round(measureText({ text: '/', fontSize: 14 }).width)

style={{ paddingRight: textWidth + 24 }}
```

### Issues

#### TBD

```log
@acme/web:dev:  ⨯ Error: Failed to load external module canvas: Error: Cannot find module '../build/Release/canvas.node'
```

<!--
pnpm approve-builds
-->

TODO

#### TBD

```log
@acme/app:build: Type error: Object literal may only specify known properties, and 'canvas' does not exist in type 'RenderParameters'.
```

TODO
