# Next.js + Progressive Web Apps (PWA)

## Links

- [Code Repository](https://github.com/shadowwalker/next-pwa)
- [Progressive Web Apps (PWA)](/pwa.md)

## Installation

```sh
# Using NPM
npm install next-pwa --save-dev

# Using Yarn
yarn add next-pwa --dev
```

## Configuration

**Refer:** `./next.config.mjs`

```mjs
const withPWA = require('next-pwa')

/**
 * @type {import('next').NextConfig}
 */
const nextConfig = {
  reactStrictMode: true,
  pwa: {
    dest: './public',
    disable: process.env.NODE_ENV === 'development',
    sourcemap: false,
  },
}

export default withPWA(nextConfig)
```

```sh
cat << EOF >> ./.gitignore
/public/sw.js
/public/sw.js.map
/public/workbox*.js
/public/workbox*.js.map
EOF
```

**Refer:** `./src/pages/_document.tsx`

```tsx
// ...
<Head>
  <meta name="theme-color" content="#FFFFFF" />

  <link rel="manifest" href="/manifest.json" />
</Head>
// ...
```

```sh
cat << EOF > ./public/manifest.json
{
  "name": "Example",
  "short_name": "Example",
  "display": "standalone",
  "orientation": "portrait",
  "theme_color": "#FFFFFF",
  "background_color": "#FFFFFF",
  "start_url": "/",
  "icons": [
    {
      "src": "/images/icons/apple-touch-icon-114x114.png",
      "type": "image/png",
      "sizes": "114x114"
    },
    {
      "src": "/images/icons/apple-touch-icon-120x120.png",
      "type": "image/png",
      "sizes": "120x120"
    },
    {
      "src": "/images/icons/apple-touch-icon-144x144.png",
      "type": "image/png",
      "sizes": "144x144"
    },
    {
      "src": "/images/icons/apple-touch-icon-152x152.png",
      "type": "image/png",
      "sizes": "152x152"
    },
    {
      "src": "/images/icons/apple-touch-icon-180x180.png",
      "type": "image/png",
      "sizes": "180x180"
    },
    {
      "src": "/images/icons/apple-touch-icon-57x57.png",
      "type": "image/png",
      "sizes": "57x57"
    },
    {
      "src": "/images/icons/apple-touch-icon-60x60.png",
      "type": "image/png",
      "sizes": "60x60"
    },
    {
      "src": "/images/icons/apple-touch-icon-72x72.png",
      "type": "image/png",
      "sizes": "72x72"
    },
    {
      "src": "/images/icons/apple-touch-icon-76x76.png",
      "type": "image/png",
      "sizes": "76x76"
    },
    {
      "src": "/images/icons/app-icon-192.png",
      "type": "image/png",
      "sizes": "192x192"
    },
    {
      "purpose": "maskable",
      "src": "/images/icons/app-icon-512.png",
      "type": "image/png",
      "sizes": "512x512"
    }
  ]
}
EOF
```
