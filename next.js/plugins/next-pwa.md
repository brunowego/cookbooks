# Progressive Web Apps (PWA)

## Links

- [Code Repository](https://github.com/shadowwalker/next-pwa)
- [Progressive Web Apps (PWA)](/pwa.md)

## Installation

### NPM or Yarn

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

/** @type {import('next').NextConfig} */
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
      "src": "/images/icons/icon-72x72.png",
      "sizes": "72x72",
      "type": "image/png",
      "purpose": "any maskable"
    },
    {
      "src": "/images/icons/icon-96x96.png",
      "sizes": "96x96",
      "type": "image/png",
      "purpose": "any maskable"
    },
    {
      "src": "/images/icons/icon-128x128.png",
      "sizes": "128x128",
      "type": "image/png",
      "purpose": "any maskable"
    },
    {
      "src": "/images/icons/icon-144x144.png",
      "sizes": "144x144",
      "type": "image/png",
      "purpose": "any maskable"
    },
    {
      "src": "/images/icons/icon-152x152.png",
      "sizes": "152x152",
      "type": "image/png",
      "purpose": "any maskable"
    },
    {
      "src": "/images/icons/icon-192x192.png",
      "sizes": "192x192",
      "type": "image/png",
      "purpose": "any maskable"
    },
    {
      "src": "/images/icons/icon-384x384.png",
      "sizes": "384x384",
      "type": "image/png",
      "purpose": "any maskable"
    },
    {
      "src": "/images/icons/icon-512x512.png",
      "sizes": "512x512",
      "type": "image/png",
      "purpose": "any maskable"
    }
  ]
}
EOF
```
