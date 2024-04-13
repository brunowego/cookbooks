# Extend with Mask

## Example

```ts
import type { MaskitoOptions } from '@maskito/core'
import { useMaskito as useMask } from '@maskito/react'

export const einMaskOptions: MaskitoOptions = {
  mask: [
    /\d/,
    /\d/,
    '.',
    /\d/,
    /\d/,
    /\d/,
    '.',
    /\d/,
    /\d/,
    /\d/,
    '/',
    /\d/,
    /\d/,
    /\d/,
    /\d/,
    '-',
    /\d/,
    /\d/,
  ],
}

export default useMask
```
