# Knex.js

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

```

<!--
"db:migrate": "knex migrate:latest",
"db:migrate:one": "knex migrate:up",
"db:migrate:make": "knex migrate:make",
"db:migrate:list": "knex migrate:list",
"db:migrate:unlock": "knex migrate:unlock",
"db:rollback": "knex migrate:rollback",
"db:rollback:one": "knex migrate:down",
"db:seed": "knex seed:run",
"db:seed:make": "knex seed:make --timestamp-filename-prefix",
-->

### Issues

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
knex migrate:list

#
knex migrate:make <name>

#
knex seed:make
```

<!--
knex migrate:latest
knex migrate:rollback
-->
