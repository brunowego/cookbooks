# next-compose-plugins

## Installation

```sh
# Using NPM
npm install next-compose-plugins

# Using Yarn
yarn add next-compose-plugins
```

## Configuration

**Refer:** `./next.config.mjs`

```mjs
import withPlugins from 'next-compose-plugins'

/**
 * @type {import('next').NextConfig}
 */
const nextConfig = {
  reactStrictMode: true,
}

export default withPlugins([], nextConfig)
```
