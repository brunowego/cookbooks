# tsup

## Links

- [Code Repository](https://github.com/egoist/tsup)
- [Main Website](https://tsup.egoist.sh/)

## CLI

### Commands

```sh
# Using npx
npx tsup -h
```

<!--
tsup.config.ts

import { defineConfig, Options } from 'tsup'

export default defineConfig((options: Options) => ({
  entry: ['src/index.ts'],
  minify: true,
  format: ['esm'],
  dts: true,
  external: ['react'],
  clean: true,
  ...options,
}))
-->
