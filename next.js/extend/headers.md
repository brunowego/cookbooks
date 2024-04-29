# Extend with Headers

## Issues

### Wrong Access Control Allow Headers

```log
TypeError [ERR_INVALID_ARG_TYPE]: The "string" argument must be of type string or an instance of Buffer or ArrayBuffer. Received an instance of Date
```

**Refer:** `./next.config.mjs`

```mjs
/**
 * @type { import('next').NextConfig }
 */
const nextConfig = {
  async headers() {
    return [
      {
        source: '/:path*',
        headers: [
          // ...
          {
            key: 'Access-Control-Allow-Headers',
            // value: '*',
            value: 'Content-Type,Date',
          },
        ],
      },
    ]
  },
}

export default nextConfig
```
