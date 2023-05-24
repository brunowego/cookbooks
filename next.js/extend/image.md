# Image

## Links

- [Image Optimization](https://nextjs.org/docs/basic-features/image-optimization)

## Configuration

**Refer:** `./next.config.mjs`

```mjs
/**
 * @type { import('next').NextConfig }
 */
const nextConfig = {
  // ...
  images: {
    domains: ['assets.xyz.tld'],
  },
}

export default nextConfig
```

## Tips

### Image Ratio

```tsx
import type { NextPage } from 'next'
import { useState } from 'react'
import Image from 'next/image'

const Home: NextPage = () => {
  const [ratio, setRatio] = useState(4 / 1)

  return (
    <Image
      src="https://assets.brunowego.com/images/logomark/any.svg"
      alt="Bruno Wego Logomark"
      width={88 * ratio}
      height={88}
      layout="fixed"
      onLoadingComplete={({ naturalWidth, naturalHeight }) =>
        setRatio(naturalWidth / naturalHeight)
      }
    />
  )
}

export default Home
```
