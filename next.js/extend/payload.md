# With Payload CMS

## Configuration

```mjs
import { withPayload } from '@payloadcms/next-payload'

/**
 * @type { import('next').NextConfig }
 */
const nextConfig = {
  // ...
}

export default withPayload(nextConfig, {
  adminRoute: '/admin',
})
```
