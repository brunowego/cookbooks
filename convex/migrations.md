# Migrations

## Docs

- [Running functions](https://docs.convex.dev/dashboard/deployments/functions#running-functions)

## Articles

- [Stateful Migrations using Mutations](https://stack.convex.dev/migrating-data-with-mutations)

## Library

### Installation

```sh
# Use pnpm
pnpm add convex-helpers
```

### Snippet

**Refer:** `./packages/db/convex/schema.ts`

```ts
import { defineSchema } from 'convex/server'
import { migrationsTable } from 'convex-helpers/server/migrations'

export default defineSchema({
  migrations: migrationsTable,
  // ...
})
```

**Refer:** `./packages/db/convex/migrations.ts`

```ts
import { makeMigration } from 'convex-helpers/server/migrations'

import { internalMutation } from './_generated/server'

const migration = makeMigration(internalMutation, {
  migrationTable: 'migrations',
})

const states = ['active', 'inactive', 'pending', 'deleted']

export const setStateUpperCase = migration({
  table: 'products',
  migrateOne: async (ctx, doc) => {
    if (doc.state && states.includes(doc.state.toLowerCase())) {
      await ctx.db.patch(doc._id, { state: doc.state.toUpperCase() })
    }
  },
})
```

### Usage

```sh
#
npx convex run migrations:myMigration '{"fn": "migrations:myMigration"}'
npx convex run migrations:myMigration '{"dryRun": true, "fn": "migrations:myMigration"}' # --prod
#
npx convex run mutations:myMigrationBatch '{"cursor": null}'
npx convex run mutations:myMigrationBatch '{"dryRun": true, "cursor": null}'
#

#
npx convex run --watch migrations:status
```
