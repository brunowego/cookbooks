# Plaiceholder Next.js

<!--
https://github.com/chrsep/grayson/blob/main/src/pages/api/me/index.ts
https://github.com/chrsep/grayson/blob/main/src/lib/image-server.ts
-->

## Installation

```sh
# Using NPM
npm install plaiceholder @plaiceholder/next --save-dev

# Using Yarn
yarn add plaiceholder @plaiceholder/next --dev
```

### Configuration

**Refer:** `./next.config.mjs`

```mjs
import withPlaiceholder from '@plaiceholder/next'

/**
 * @type {import('next').NextConfig}
 */
const nextConfig = {
  reactStrictMode: true,
}

export default withPlaiceholder(nextConfig)
```
