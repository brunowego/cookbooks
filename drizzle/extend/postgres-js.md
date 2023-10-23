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

<!--
ModuleBuildError: Module build failed: UnhandledSchemeError: Reading from "cloudflare:sockets" is not handled by plugins (Unhandled scheme).

Downgrade postgres to v3.3.5
-->
