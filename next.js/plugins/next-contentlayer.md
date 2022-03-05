# next-contentlayer

## Dependencies

- [Contentlayer](/contentlayer.md#library)

## Installation

```sh
# Using NPM
npm install next-contentlayer

# Using Yarn
yarn add next-contentlayer
```

## Configuration

**Refer:** `./next.config.mjs`

```mjs
import { withContentlayer } from 'next-contentlayer'

/**
 * @type {import('next').NextConfig}
 */
const nextConfig = {
  reactStrictMode: true,
}

export default withContentlayer()(nextConfig)
```
