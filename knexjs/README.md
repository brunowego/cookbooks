# Knex.js

## Links

- [Code Repository](https://github.com/knex/knex)
- [Main Website](https://knexjs.org)

## CLI

### Usage

```sh
#
knex migrate:list
```

<!--
knex migrate:make
knex migrate:latest
knex migrate:rollback
-->

## Library

### Installation

```sh
# Using pnpm
pnpm add knex pg
```

### Issues

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
