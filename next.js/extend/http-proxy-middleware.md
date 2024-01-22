# http-proxy-middleware

<!--
https://github.com/refinedev/refine/blob/master/examples/store/pages/api/store/%5B%5B...path%5D%5D.ts
-->

## Configuration

**Refer:** `./src/app/api/store/[[...path]].ts`

```ts
import { createProxyMiddleware } from 'http-proxy-middleware'

export default createProxyMiddleware({
  target: 'https://api.store.refine.dev',
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
