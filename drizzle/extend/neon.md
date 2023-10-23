# Extend with Neon

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
