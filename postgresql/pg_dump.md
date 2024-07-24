# pg_dump

## Usage

```sh
#
pg_dump \
  -h 127.0.0.1 \
  -p 5432 \
  -U <username> \
  -t 'public.products' \
  --schema-only \
  <db-name> \
  > ./dump.sql
```
