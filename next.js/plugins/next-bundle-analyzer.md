# Next.js + Webpack Bundle Analyzer

## Links

- [Code Repository](https://github.com/vercel/next.js/tree/canary/packages/next-bundle-analyzer)

## Library

## Dependencies

- [cross-env](/cross-env.md)

### Installation

### NPM or Yarn

```sh
# Using NPM
npm install @next/bundle-analyzer --save-dev

# Using Yarn
yarn add @next/bundle-analyzer --dev
```

### Configuration

**Refer:** `./next.config.mjs`

```mjs
import nextBundleAnalyzer from '@next/bundle-analyzer'

const withBundleAnalyzer = nextBundleAnalyzer({
  enabled: process.env.ANALYZE === 'true',
})

/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
}

export default withBundleAnalyzer(nextConfig)
```

```sh
ANALYZE=true npm run build
```

**Refer:** `./package.json`

```json
{
  "scripts": {
    // ...
    "build:analyze": "cross-env ANALYZE=true npm run build",
  }
}
```
