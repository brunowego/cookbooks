# Next.js + Transpile `node_modules`

## Links

- [Code Repository](https://github.com/martpie/next-transpile-modules)

## Configuration

```mjs
import nextTranspileModules from 'next-transpile-modules'

const withTM = nextTranspileModules(['@acme/ui'])

/**
 * @type {import('next').NextConfig}
 */
const nextConfig = {
  reactStrictMode: true,
}

export default withTM(nextConfig)
```

## Issues

### Missing Transpile `node_modules`

```log
Module parse failed: Unexpected token (2:9)
You may need an appropriate loader to handle this file type, currently no loaders are configured to process this file. See https://webpack.js.org/concepts#loaders
```

```log
Module parse failed: The keyword 'interface' is reserved (3:0)
You may need an appropriate loader to handle this file type, currently no loaders are configured to process this file. See https://webpack.js.org/concepts#loaders
```

Just install and configure `next-transpile-modules`.
