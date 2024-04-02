# Extend with Security Headers

<!--
https://github.com/QuivrHQ/quivr/blob/main/frontend/next.config.js
-->

## Configuraiton

```mjs
const ContentSecurityPolicy = {
  'default-src': [
    "'self'",
    // 'https://fonts.googleapis.com',
    // 'https://*.vercel.app',
    process.env.NEXT_PUBLIC_BASE_URL,
  ],
  'connect-src': ["'self'", process.env.NEXT_PUBLIC_BASE_URL],
  'img-src': ["'self'", 'data:', '*'],
  'media-src': [
    "'self'",
    // 'https://*.vercel.app',
    process.env.NEXT_PUBLIC_BASE_URL,
  ],
  'script-src': [
    "'unsafe-inline'",
    "'unsafe-eval'",
    // 'https://*.vercel.app',
    // 'https://www.google-analytics.com/',
    process.env.NEXT_PUBLIC_BASE_URL,
  ],
  // 'frame-src': [],
  'frame-ancestors': ["'none'"],
  'style-src': [
    "'unsafe-inline'",
    process.env.NEXT_PUBLIC_BASE_URL,
    // 'https://*.vercel.app',
  ],
}

const cspString = Object.entries(ContentSecurityPolicy)
  .map(([key, values]) => `${key} ${values.join(' ')};`)
  .join(' ')

const securityHeaders = [
  {
    key: 'Content-Security-Policy',
    value: cspString,
  },
  {
    key: 'Cross-Origin-Embedder-Policy',
    value: 'require-corp',
  },
  {
    key: 'Cross-Origin-Opener-Policy',
    value: 'same-origin',
  },
  {
    key: 'Cross-Origin-Resource-Policy',
    value: 'cross-origin',
  },
  {
    key: 'Permissions-Policy',
    value: 'camera=(), microphone=(), geolocation=()',
  },
  {
    key: 'Referrer-Policy',
    value: 'no-referrer-when-downgrade',
  },
  {
    key: 'X-Content-Type-Options',
    value: 'nosniff',
  },
  {
    key: 'X-DNS-Prefetch-Control',
    value: 'on',
  },
  {
    key: 'X-Frame-Options',
    value: 'DENY',
  },
]

/**
 * @type { import('next').NextConfig }
 */
const nextConfig = {
  async headers() {
    return [
      {
        source: '/:path*',
        headers: securityHeaders,
      },
    ]
  },

  // ...
}

export default nextConfig
```
