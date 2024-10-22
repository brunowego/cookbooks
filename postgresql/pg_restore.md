# pg_restore

## Tips

### Large Databases

```sh
#
export DATABASE_URL=postgres://acme:acme@localhost:5432/acme

#
psql -d "$DATABASE_URL" -c 'ALTER USER acme WITH SUPERUSER'

# Compresed
pg_restore \
  --dbname $DATABASE_URL \
  --clean \
  --if-exists \
  --create \
  ./<path/to/dump.backup>
```

## Issues

### TBD

```log
pg_restore: error: input file appears to be a text format dump. Please use psql.
```

TODO
