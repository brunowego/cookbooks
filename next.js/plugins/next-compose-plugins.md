# next-compose-plugins

## Links

- [Code Repository](https://github.com/cyrilwanner/next-compose-plugins)

## Installation

```sh
# Using NPM
npm install next-compose-plugins

# Using Yarn
yarn add next-compose-plugins

# Using Bun
bun add next-compose-plugins
```

## Configuration

**Refer:** `./next.config.mjs`

```mjs
import withPlugins from 'next-compose-plugins'

/**
 * @type { import('next').NextConfig }
 */
const nextConfig = {
  // ...
}

export default withPlugins([], nextConfig)
```
