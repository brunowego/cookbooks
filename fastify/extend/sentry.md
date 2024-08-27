# Extend with Sentry

## Links

- [Docs](https://docs.sentry.io/platforms/javascript/guides/fastify)
  - [Source Maps](https://docs.sentry.io/platforms/javascript/guides/fastify/sourcemaps/)
- [Example](https://github.com/getsentry/sentry-javascript-examples/tree/main/apps/fastify)

## Examples

- [Fastify with Helmet](https://github.com/brunowego/fastify-journey/tree/with-autoload)

## Installation

```sh
#
pnpm add @sentry/node @sentry/profiling-node
```

## Issues

### TBD

```log
- warning: could not determine a source map reference (Could not auto-detect referenced sourcemap for ~/index.js)
```

**Refer:** `./tsconfig.build.json`

```json
{
  "$schema": "https://json.schemastore.org/tsconfig",
  "compilerOptions": {
    // ...
    "sourceMap": true
  }
  // ...
}
```
