# Liam

**Keywords:** ERD

## Links

- [Code Repository](https://github.com/liam-hq/liam)
- [Main Website](https://liambx.com)

## CLI

### Initialize

```sh
npx @liam-hq/cli init
```

### Usage

```sh
#
pg_dump --schema-only --file=./schema.sql postgres://username:password@hostname:5432/dbname

#
npx @liam-hq/cli erd build --input ./schema.sql --format postgres

#
npx http-server ./dist
```
