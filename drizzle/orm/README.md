# Drizzle ORM

<!--
https://github.com/RonHouben/strumtastic/tree/main/packages/database/src/repositories

https://github.com/ixahmedxi/noodle/tree/main/packages/db
https://github.com/openstatusHQ/openstatus/tree/main/packages/db
https://github.com/unkeyed/unkey/tree/main/packages/db
https://github.com/WYGIN/wygin.tech/tree/main/packages/drizzle-db
https://github.com/awaaate/atenea/tree/main/packages/db/
https://github.com/erickpeixoto/invoice-app

https://github.com/jeanhdev/solstice
https://github.com/loglib/loglib
https://github.com/kleva-j/Taskaider
https://github.com/dichioniccolo/bloghub
-->

<!--
.where(sql`${organizationsTable.name} = ${name} COLLATE NOCASE`)

.where(
  sql`(${organizationsTable.name} COLLATE NOCASE LIKE ${`%${name}%`})`,
)
-->

**Keywords:** TypeScript ORM, Only SQL, Headless ORM

## Links

- [Code Repository](https://github.com/drizzle-team/drizzle-orm)
- [Main Website](https://orm.drizzle.team)

## Library

### Installation

```sh
# Using pnpm
pnpm add @faker-js/faker dotenv drizzle-kit pg tsx -D
pnpm add @paralleldrive/cuid2 drizzle-orm postgres zod
```

### Configuration

```sh
mkdir -p ./src/db/{migrations,schemas}
```

**Refer:** `./src/db/schemas/index.ts`

```ts
import { createId } from '@paralleldrive/cuid2'
import { pgEnum, pgTable, text, timestamp } from 'drizzle-orm/pg-core'

export const userRoleEnum = pgEnum('user_role', [
  'admin',
  'manager',
  'customer',
])

export const users = pgTable('users', {
  id: text('id')
    .$defaultFn(() => createId())
    .primaryKey(),
  name: text('name').notNull(),
  email: text('email').notNull().unique(),
  phone: text('phone'),
  role: userRoleEnum('role').default('customer').notNull(),
  createdAt: timestamp('created_at').defaultNow(),
  updatedAt: timestamp('updated_at').defaultNow(),
})
```

**Refer:** `./src/env.ts`

```ts
import { z } from 'zod'

const envSchema = z.object({
  DATABASE_URL: z.string().url().min(1),
})

export const env = envSchema.parse(process.env)
```

**Refer:** `./drizzle.config.ts`

```ts
import type { Config } from 'drizzle-kit'

import { env } from './src/env'

export default {
  out: './src/db/migrations',
  schema: './src/db/schemas/*.ts',
  driver: 'pg',
  dbCredentials: {
    connectionString: env.DATABASE_URL,
  },
} satisfies Config
```

**Refer:** `./package.json`

```json
{
  // ...
  "type": "module",
  "scripts": {
    "db:generate": "drizzle-kit generate",
    // "db:migrate": "dotenv -- tsx ./src/db/migrate.ts",
    "db:migrate": "drizzle-kit push",
    "db:seed": "dotenv -- tsx ./src/db/seed.ts",
    "db:studio": "drizzle-kit studio"
    // ...
  }
}
```

**Refer:** `./tsconfig.json`

```json
{
  "include": ["drizzle.config.ts"]
}
```

### Issues

#### TBD

```log
@acme/db:db:generate: No config path provided, using default 'drizzle.config.ts'
@acme/db:db:generate: Reading config file '/path/to/packages/db/drizzle.config.ts'
@acme/db:db:generate: Error: ENOENT: no such file or directory, open 'src/migrations/meta/_journal.json'
...
@acme/db:db:generate:   errno: -2,
@acme/db:db:generate:   code: 'ENOENT',
@acme/db:db:generate:   syscall: 'open',
@acme/db:db:generate:   path: 'src/migrations/meta/_journal.json'
@acme/db:db:generate: }
```

**Refer:** `./src/migrations/meta/_journal.json`

```sh
{
  "version": "7",
  "dialect": "postgresql",
  "entries": []
}
```

#### TBD

```log
@acme/app:dev:  ⨯ ../../node_modules/.pnpm/pg-connection-string@2.9.1/node_modules/pg-connection-string/index.js:81:1
@acme/app:dev: Module not found: Can't resolve 'fs'
@acme/app:dev:   79 |
@acme/app:dev:   80 |   // Only try to load fs if we expect to read from the disk
@acme/app:dev: > 81 |   const fs = config.sslcert || config.sslkey || config.sslrootcert ? require('fs') : null
@acme/app:dev:      | ^
@acme/app:dev:   82 |
@acme/app:dev:   83 |   if (config.sslcert) {
@acme/app:dev:   84 |     config.ssl.cert = fs.readFileSync(config.sslcert).toString()
```

<!--
https://stackoverflow.com/questions/79260989/pg-next-js-15-module-not-found-cant-resolve-fs
-->

Check if you are not accessing client-side code in the server-side code or vice versa.

#### TBD

```log
../../node_modules/.pnpm/postgres@3.4.5/node_modules/postgres/src/connection.js:1:1

Module not found: Can't resolve 'net'
> 1 | import net from 'net'
    | ^
  2 | import tls from 'tls'
  3 | import crypto from 'crypto'
  4 | import Stream from 'stream'
```

Try

```ts
// from
import {
  updateUserSchema,
  // ...
} from '@acme/db'

// to
import {
  updateUserSchema,
  // ...
} from '@acme/db/schemas'
```

#### TBD

```log
TypeError: Value is not JSON serializable
```

<!--
Try check the API route.
-->

TODO

#### TBD

```log
TypeError: Cannot read properties of undefined (reading 'referencedTable')
```

TODO

#### TBD

```log
Type 'never[] & Iterable<never> & ResultQueryMeta<number, string | number | symbol>' is missing the following properties from type '{ name: string; id: string; url: string; userId: string; createdAt: Date; updatedAt: Date; }': name, id, url, userId, and 2 more. ts(2740)
```

TODO

#### TBD

```log
Type '{ name: string; id: string; url: string; userId: string; createdAt: Date; updatedAt: Date; }[]' is missing the following properties from type '{ name: string; id: string; url: string; userId: string; createdAt: Date; updatedAt: Date; }': name, id, url, userId, and 2 more.ts(2740)
```

TODO

#### Missing Type Module

```log
Top-level await is currently not supported with the "cjs" output format
```

**Refer:** `./package.json`

```json
{
  // ...
  "type": "module"
  // ...
}
```

#### Wrong Instance of Date

```log
TypeError [ERR_INVALID_ARG_TYPE]: The "string" argument must be of type string or an instance of Buffer or ArrayBuffer. Received an instance of Date
```

Rollback `drizzle-orm` package version from "~0.30.1" to "~0.29.4".

#### TBD

```log
Please add a primary key column to your table to update or delete rows
```

TODO

#### TBD

```log
No config path provided, using default 'drizzle.config.ts'
```

TODO

#### TBD

```log
terminating connection due to immediate shutdown command
```

TODO

#### TBD

```log
Type 'string' is not assignable to type 'unknown[]'.
```

<!-- Try check if you are using `User` instead of `UpsertUser` under the types. -->

TODO
