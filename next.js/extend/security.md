# Next.js Security

## Links

- [Content Security Policy (CSP)](https://developer.mozilla.org/en-US/docs/Web/HTTP/CSP)
- [Security Headers](https://nextjs.org/docs/advanced-features/security-headers)

## Related

- [Security Headers](/securityheaders.md)

## Configuration

**Refer:** `./next.config.mjs`

```mjs
const ContentSecurityPolicy = `
  default-src 'self';
`;

const securityHeaders = [
  {
    key: 'Content-Security-Policy',
    value: ContentSecurityPolicy.replace(/\n/g, ''),
  },
  {
    key: 'Permissions-Policy',
    value: 'geolocation=()',
  },
  {
    key: 'Referrer-Policy',
    value: 'no-referrer',
  },
  {
    key: 'Strict-Transport-Security',
    value: 'max-age=31536000',
  },
  {
    key: 'X-Content-Type-Options',
    value: 'nosniff',
  },
  {
    key: 'X-Frame-Options',
    value: 'SAMEORIGIN',
  },
]

/**
 * @type {import('next').NextConfig}
 */
const nextConfig = {
  reactStrictMode: true,
  headers: async () => [
    {
      source: '/:path*',
      headers: securityHeaders,
    },
  ],
}

export default nextConfig
```

<!--
accelerometer=(),
ambient-light-sensor=(),
autoplay=(),
camera=(),
cross-origin-isolated=(),
display-capture=(),
document-domain=(),
encrypted-media=(),
execution-while-not-rendered=(),
execution-while-out-of-viewport=(),
fullscreen=(),
geolocation=(),
gyroscope=(),
interest-cohort=(),
magnetometer=(),
microphone=(),
midi=(),
payment=(),
picture-in-picture=(),
publickey-credentials-get=(),
screen-wake-lock=(),
sync-xhr=(),
usb=(),
xr-spatial-tracking=(),
-->

## Testing

```sh
#
yarn build

#
yarn start

#
ngrok http 3000
```
