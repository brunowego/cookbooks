# Rewrites

<!--
https://maxschmitt.me/posts/next-js-api-proxy
https://posthog.com/docs/advanced/proxy/nextjs-middleware
-->

<!--
https://github.com/stegano/next-http-proxy-middleware
https://github.com/github/docs/blob/main/package.json
-->

<!--
https://github.com/refinedev/refine/blob/master/examples/store/pages/api/store/%5B%5B...path%5D%5D.ts
-->

<!--
OLD

**Refer:** `./src/app/api/<name>/[[...path]].ts`

```ts
import { createProxyMiddleware } from 'http-proxy-middleware'

export default createProxyMiddleware({
  target: 'https://api.<name>.example.tld',
  changeOrigin: true,
  pathRewrite: { '^/api': '/' },
})

export const config = {
  api: {
    bodyParser: false, // Enable POST requests
    externalResolver: true, // Hide warning message
  },
}
```
-->

## Configuration

```mjs
/**
 * @type { import('next').NextConfig }
 */
const nextConfig = {
  transpilePackages: ['@shopner/ui'],

  async rewrites() {
    return [
      {
        source: '/api/barcode/:path*',
        destination: 'http://localhost:4000/:path*',
      },
    ]
  },
}

export default nextConfig
```

<!--
has: [
  {
    type: 'header',
    key: 'Accept',
    value: '.*(image|audio|video|application)/.*',
  },
],
-->
