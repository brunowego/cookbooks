# Extend with Crypto

## Issues

### TBD

```log
Module build failed: UnhandledSchemeError: Reading from "node:crypto" is not handled by plugins (Unhandled scheme).
Webpack supports "data:" and "file:" URIs by default.
You may need an additional plugin to handle "node:" URIs.
```

```mjs
/**
 * @type { import('next').NextConfig }
 */
const nextConfig = {
  webpack: (config) => {
    config.externals.push({
      'node:crypto': 'commonjs crypto',
    })

    return config
  },
}

export default nextConfig
```

TODO
