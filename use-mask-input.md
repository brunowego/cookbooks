# use-mask-input

## Links

- [Code Repository](https://github.com/eduardoborges/use-mask-input)

## Library

### Configuration

```ts
import { withMask } from 'use-mask-input'

const zipCodeRef = withMask(['99.999-999'], {
  autoUnmask: true,
  showMaskOnFocus: false,
  showMaskOnHover: false,
})

<input
  // ...
  // @ts-ignore
  ref={zipCodeRef}
/>
```
