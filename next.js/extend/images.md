# Images

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
    remotePatterns: [
      {
        protocol: 'https',
        hostname: 'assets.xyz.tld',
      },
    ],
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

## Issues

### TBD

```log
The "images.domains" configuration is deprecated. Please use "images.remotePatterns" configuration instead.
```

TODO

<!--
const domains = String(process.env.NEXT_PUBLIC_IMAGES_DOMAINS || "").split(",")

const images = {
  domains: [
    "s.gravatar.com",
    "lh3.googleusercontent.com",
    "api.mapbox.com",
    ...domains
  ],
}

if (process.env.NODE_ENV !== "production") {
  images["domains"].push("localhost")
}

/** @type {import('next').NextConfig} */
const nextConfig = {
  images,
}

export default nextConfig
-->
