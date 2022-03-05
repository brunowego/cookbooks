# Image

## Links

- [Image Optimization](https://nextjs.org/docs/basic-features/image-optimization)

## Configuration

**Refer:** `./next.config.mjs`

```mjs
/**
 * @type {import('next').NextConfig}
 */
const nextConfig = {
  reactStrictMode: true,
  images: {
    domains: ['assets.example.com'],
  },
}

export default nextConfig
```
