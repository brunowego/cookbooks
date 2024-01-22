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

https://github.com/uninbox/UnInbox
-->

**Keywords:** TypeScript ORM, Only SQL

## Links

- [Code Repository](https://github.com/drizzle-team/drizzle-orm)
- [Main Website](https://orm.drizzle.team)

## Library

### Installation

```sh
# Using pnpm
pnpm add @faker-js/faker dotenv drizzle-kit pg tsx -D
pnpm add @paralleldrive/cuid2 drizzle-orm postgres zod
# drizzle-typebox drizzle-zod pg
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
    "db:generate": "drizzle-kit generate:pg",
    "db:migrate": "dotenv -- tsx ./src/db/migrate.ts",
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

### Snippets

```ts

```

### Issues

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

#### TBD

```log
No config path provided, using default 'drizzle.config.ts'
```

TODO
