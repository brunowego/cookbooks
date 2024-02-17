# SVGR

## Links

- [React SVGR](/react/react-svgr.md)

## Installation

```sh
# Using NPM
npm install @svgr/webpack --save-dev

# Using Yarn
yarn add @svgr/webpack --dev

# Using pnpm
pnpm add @svgr/webpack -D

# Using Bun
bun add @svgr/webpack -D
```

## Configuration

**Refer:** `./next.config.mjs`

```mjs
/**
 * @type { import('next').NextConfig }
 */
const nextConfig = {
  // ...
  webpack: (config) => {
    // config.module.rules.push({
    //   test: /\.svg$/i,
    //   issuer: /\.tsx?$/,
    //   use: [
    //     {
    //       loader: '@svgr/webpack',
    //       options: {
    //         svgoConfig: {
    //           plugins: [
    //             {
    //               name: 'removeViewBox',
    //               active: false,
    //             },
    //           ],
    //         },
    //       },
    //     },
    //   ],
    // })

    config.module.rules.push({
      test: /\.svg$/,
      use: ['@svgr/webpack'],
    })

    return config
  },
}

export default nextConfig
```

## Issues

### Chalk ESM Error

```log
Error [ERR_REQUIRE_ESM]: require() of ES Module </absolute/path/to>/node_modules/ansi-styles/index.js from </absolute/path/to>/node_modules/chalk/index.js not supported.
```

<!--
https://stackoverflow.com/questions/70309135/chalk-error-err-require-esm-require-of-es-module
-->

**Refer:** `./package.json`

```json
{
  // ...
  "overrides": {
    "chalk": "5.3.0"
  }
}
```
