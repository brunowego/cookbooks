# Next.js humans.txt

## Configuration

**Refer:** `./next.config.mjs`

```mjs
/**
 * @type {import('next').NextConfig}
 */
const nextConfig = {
  reactStrictMode: true,
  rewrites: async () => {
    return [
      { source: '/humans.txt', destination: '/about' },
      // ...
    ]
  },
}

export default nextConfig
```
