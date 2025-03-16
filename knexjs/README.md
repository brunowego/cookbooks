# Knex.js

<!--
upsert
findOrCreate
-->

## Links

- [Code Repository](https://github.com/knex/knex)
- [Main Website](https://knexjs.org)

## Library

### Installation

```sh
# Using pnpm
pnpm add knex pg
```

### Initialize

```sh
pnpx knex init -x ts

mkdir -p ./db/migrations
```

### Configuration

**Refer:** `./package.json`

```json
// TODO
```

<!--
"db:seed": "knex seed:run",
"db:seed:make": "knex seed:make --timestamp-filename-prefix",
-->

### Tips

#### Query Debugging

```sh
echo 'DEBUG=knex:query' >> ./.env
```

<!--
yourQuery.toSQL().toNative()
-->

### Issues

#### TBD

```log
Requiring external module ts-node/register
knex: Required configuration option 'client' is missing.
Error: knex: Required configuration option 'client' is missing.
```

<!--
NODE_ENV=staging

https://github.com/knex/knex/issues/5394
-->

TODO

#### Missing `ts-node`

```log
Cannot use import statement outside a module /absolute/path/to/knexfile.ts:1
import type { Knex } from 'knex'
^^^^^^
SyntaxError: Cannot use import statement outside a module
```

```sh
pnpm add ts-node -D
```

<!-- ####

TS_NODE_PROJECT=tsconfig.knex.json

{
  "$schema": "https://json.schemastore.org/tsconfig",
  "compilerOptions": {
    "module": "CommonJS"
  }
}
-->

#### TBD

```log
knex: Required configuration option 'client' is missing.
Error: knex: Required configuration option 'client' is missing.
```

TODO

#### Missing Database URL

```log
SASL: SCRAM-SERVER-FIRST-MESSAGE: client password must be a string
```

Missing `DATABASE_URL` environment variable.

#### TBD

```log
function uuid_generate_v4() does not exist
```

```sql
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
```

## CLI

### Usage

```sh
#
knex seed:make
```

<!--
knex seed:make --timestamp-filename-prefix <name>
-->

### Issues

#### TBD

```log
error: create table "migrations" ("id" serial primary key, "name" varchar(255), "batch" integer, "migration_time" timestamptz) - no schema has been selected to create in
```

<!--
https://github.com/knex/knex/issues/1897
-->

<!--
Try in another time, perhaps a problem with server outage
-->

TODO

#### Missing `ts-node`

```log
Unknown file extension ".ts" for /absolute/path/to/knexfile.ts
```

<!--
https://github.com/knex/knex/issues/4793
https://github.com/knex/knex/issues/6087
-->

```sh
pnpm add ts-node -D
```
