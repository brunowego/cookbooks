# Extend with node-postgres

## Installation

```sh
# Using pnpm
pnpm add pg
```

## Configuration

**Refer:** `./src/index.ts`

```ts
import { drizzle } from 'drizzle-orm/node-postgres'
import { Pool } from 'pg'

import { env } from '@shopner/env/db'

import * as schema from './schemas'

export * from 'drizzle-orm'

const client = new Pool({
  connectionString: env.DATABASE_URL,
})

const db = drizzle(client, {
  logger: env.NODE_ENV === 'development',
  schema,
})

export { schema, db }
```

## Issues

### TBD

```log
The edge runtime does not support Node.js 'crypto' module.
```

<!--
https://github.com/vvo/iron-session/issues/543
-->

TODO
