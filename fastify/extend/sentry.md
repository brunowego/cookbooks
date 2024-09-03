# Extend with Sentry

<!--
https://github.com/theponti/rocco-api
https://github.com/CNLHC/rubbish-dashboard-template

https://github.com/kamilkisiela/graphql-hive/blob/main/packages/services/service-common/src/sentry.ts
https://github.com/Folderr/Folderr/blob/dev/src/backend/Structures/plugins/sentry.ts
https://github.com/theponti/rocco-api/blob/main/src/plugins/sentry.ts
https://github.com/FlawedLabs/Evenner/blob/main/packages/server/src/plugins/sentry.ts
-->

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

### TBD

```log
[Sentry] fastify is not instrumented. This is likely because you required/imported fastify before calling `Sentry.init()`.
```

<!--
https://github.com/getsentry/sentry-javascript/issues/12119
-->

TODO
