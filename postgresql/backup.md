# PostgreSQL Backup

## Tips

```sh
# Backup
pg_dump \
  -d <db-name> \
  -h 127.0.0.1 \
  -U postgres \
  -n public \
  > ./dump-$(date -u '+%Y.%m.%d-%H%M').sql

# or, with DATABASE_URL
export DATABASE_URL=''

pg_dump \
  -d "$DATABASE_URL" \
  -n public \
  -x \
  > ./dump-$(date -u '+%Y.%m.%d-%H%M').sql

# Restore
# TODO

# or, with DATABASE_URL
psql \
  -d "$DATABASE_URL" \
  < ./dump-<date>.sql
```

## Issues

### TBD

```log
ERROR:  permission denied to change default privileges
```

TODO
