# next-contentlayer

<!--
https://github.com/startkit-dev/next/blob/main/contentlayer.config.ts
-->

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
 * @type { import('next').NextConfig }
 */
const nextConfig = {
  // ...
}

export default withContentlayer()(nextConfig)
```

## Issues

### TBD

```log
TypeError: The "code" argument must be of type number. Received an instance of Object
```

<!--
https://github.com/contentlayerdev/contentlayer/issues/495
-->

TODO

### TBD

```log
<w> [webpack.cache.PackFileCacheStrategy/webpack.FileSystemInfo] Parsing of /path/to/project/node_modules/.pnpm/@contentlayer+core@0.3.4_esbuild@0.18.17/node_modules/@contentlayer/core/dist/dynamic-build.js for build dependencies failed at 'import(`file://${compiledConfigPath}`)'.
```

<!--
https://github.com/shadcn-ui/taxonomy/issues/100
-->

TODO
