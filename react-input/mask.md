# @react-input/mask

## Links

- [Code Repository](https://github.com/GoncharukBro/react-input/tree/main/packages/mask)

## Library

### Configuration

```tsx
import { useMask } from '@react-input/mask'

const zipCodeRef = useMask({
  mask: '__.___-___',
  replacement: { _: /\d/ },
})

<input
  // ...
  ref={zipCodeRef}
/>
```
