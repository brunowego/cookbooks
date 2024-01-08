# With Server Side Rendering (SSR)

## Tips

### Disable SSR

**Refer:** `./page.tsx`

```ts
import dynamic from 'next/dynamic'
import type { JSX } from 'react'

const Page = (): JSX.Element => {
  // ...
}

export default dynamic(() => Promise.resolve(Page), {
  ssr: false,
})
```
