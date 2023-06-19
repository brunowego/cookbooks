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
