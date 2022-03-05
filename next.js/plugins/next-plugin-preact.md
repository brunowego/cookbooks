# Next.js + Preact

## Links

- [Code Repository](https://github.com/preactjs/next-plugin-preact)

## Installation

```sh
# Using NPM
npm install \
  next \
  next-plugin-preact \
  preact \
  react@npm:@preact/compat \
  react-dom@npm:@preact/compat \
  react-ssr-prepass@npm:preact-ssr-prepass \
  preact-render-to-string \
  --save

# Using Yarn
yarn add \
  next \
  next-plugin-preact \
  preact \
  react@npm:@preact/compat \
  react-dom@npm:@preact/compat \
  react-ssr-prepass@npm:preact-ssr-prepass \
  preact-render-to-string
```

## Configuration

```mjs
import withPreact from 'next-plugin-preact'

/**
 * @type {import('next').NextConfig}
 */
const nextConfig = {
  reactStrictMode: true,
}

export default withPreact(nextConfig)
```
