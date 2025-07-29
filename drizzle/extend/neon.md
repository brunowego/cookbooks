# Extend with Neon

<!--
https://github.com/remvze/katana/blob/main/src/database/drizzle.ts
https://github.com/rsastri21/crew-match-2/blob/main/src/db/index.ts

https://github.com/Nathan-Somto/designr/blob/main/packages/db/src/client.ts
-->

TODO

<!-- ```ts
import { neon, neonConfig } from '@neondatabase/serverless'
import { drizzle } from 'drizzle-orm/neon-http'

import { env } from '@acme/env'

import * as schema from './schema'

neonConfig.fetchConnectionCache = true

const client = neon(env.DATABASE_URL)

export * from 'drizzle-orm'

export const db = drizzle(client, {
  logger: env.NODE_ENV === 'development',
  schema,
})
``` -->
