# Extend with Postgres.js

## Installation

```sh
# Using pnpm
pnpm add postgres
```

## Configuration

**Refer:** `./src/index.ts`

```ts
import { drizzle } from 'drizzle-orm/postgres-js'
import postgres from 'postgres'

import { env } from '@acme/db'

import * as schema from './schemas'

const client = postgres(env.DATABASE_URL)

const db = drizzle(client, {
  logger: env.NODE_ENV === 'development',
  schema,
})

export * from 'drizzle-orm'

export { db, schema }
```

## Issues

### TBD

```log
ModuleBuildError: Module build failed: UnhandledSchemeError: Reading from "node:stream" is not handled by plugins (Unhandled scheme).
Webpack supports "data:" and "file:" URIs by default.
You may need an additional plugin to handle "node:" URIs.
```

TODO

### Downgrade Postgres.js

```log
Module build failed: UnhandledSchemeError: Reading from "cloudflare:sockets" is not handled by plugins (Unhandled scheme).
Webpack supports "data:" and "file:" URIs by default.
You may need an additional plugin to handle "cloudflare:" URIs.
```

<!--
Try remove:

export const runtime = 'edge'
-->

<!--
https://github.com/vercel/next.js/discussions/50177
-->

Downgrade `postgres` package from `3.4.x` to version `3.3.5`.

### TBD

```log
The edge runtime does not support Node.js 'net' module.
```

```log
Error: Module not found: Can't resolve 'net'
```

<!--
https://github.com/drizzle-team/drizzle-orm/issues/753
https://github.com/t3-oss/create-t3-turbo/issues/634

https://github.com/vercel/examples/tree/main/storage/postgres-drizzle
-->

TODO

<!--
/**
 * @type { import('next').NextConfig }
 */
const nextConfig = {
  // ...
  webpack(config, { isServer }) {
    if (!isServer) {
      config.resolve = {
        ...config.resolve,
        fallback: {
          ...config.resolve.fallback,
          fs: false,
          net: false,
          tls: false,
        },
      }
    }

    return config
  },
}

export default nextConfig
-->

<!--
/**
 * @type { import('next').NextConfig }
 */
const nextConfig = {
  // ...
  webpack(config, { nextRuntime }) {
    if (nextRuntime !== 'nodejs') return config

    config.resolve = {
      ...config.resolve,
      fallback: {
        ...config.resolve.fallback,
        // fs: false,
        net: false,
        // tls: false,
      },
    }

    return config
  },
}

export default nextConfig
-->
