# Extend with CORS

<!--
https://stackoverflow.com/questions/70995299/allow-cors-from-one-next-js-app-to-another
-->

## Configuration

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
          { key: 'Access-Control-Allow-Credentials', value: 'true' },
          { key: 'Access-Control-Allow-Origin', value: '*' },
          {
            key: 'Access-Control-Allow-Headers',
            value: 'Authorization,Content-Type',
          },
        ],
      },
    ]
  },

  // ...
}

export default nextConfig
```

## Issues

### TBD

```log
Access to XMLHttpRequest at 'http://app.acme.localtest.me:3000/' (redirected from 'http://api.acme.localtest.me:3000/auth/sign-up') from origin 'http://auth.acme.localtest.me:3000' has been blocked by CORS policy: Response to preflight request doesn't pass access control check: Redirect is not allowed for a preflight request.
```

TODO
