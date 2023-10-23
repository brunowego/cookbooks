# Extend with PlanetScale

TODO

<!-- ```ts
import { connect } from '@planetscale/database'
import { drizzle } from 'drizzle-orm/planetscale-serverless'

import { env } from '@acme/env'

import * as schema from './schema'

const client = connect({
  url: env.DATABASE_URL,
})

export * from 'drizzle-orm'

export const db = drizzle(client, {
  logger: env.NODE_ENV === 'development',
  schema,
})
``` -->
