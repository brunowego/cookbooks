# Extend with Drizzle

<!--
https://github.com/metis-data/node-nestjs-postgresql-drizzle/blob/main/src/drizzle/drizzle.service.ts
-->

TODO

## Issues

### Reuse Connection

```log
Error: sorry, too many clients already
```

<!--
https://www.answeroverflow.com/m/1146224610002600067
-->

**Refer:** `./packages/db/src/db.ts`

```ts
import { type PostgresJsDatabase, drizzle } from 'drizzle-orm/postgres-js'

import { client } from './client'
import * as schema from './schema'
import { env } from './env'

declare global {
  // biome-ignore lint/style/noVar: to support hot reloading
  var db: PostgresJsDatabase<typeof schema> | undefined
}

// biome-ignore lint/suspicious/noRedeclare: to support hot reloading
let db: PostgresJsDatabase<typeof schema>

if (env.NODE_ENV === 'production') {
  db = drizzle(client, {
    schema,
  })
} else {
  global.db =
    global.db ??
    drizzle(client, {
      logger: env.NODE_ENV === 'development',
      schema,
    })

  db = global.db
}

export { db }
```
