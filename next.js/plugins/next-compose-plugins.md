# next-compose-plugins

## Installation

### NPM or Yarn

```sh
# Using NPM
npm install next-compose-plugins --save-dev

# Using Yarn
yarn add next-compose-plugins --dev
```

## Configuration

**Refer:** `./next.config.mjs`

```mjs
import withPlugins from 'next-compose-plugins'

/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
}

export default withPlugins([...plugins], nextConfig)
```
