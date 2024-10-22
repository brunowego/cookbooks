# Drizzle ORM Migrations

## Tips

### Backup and Restore

```sh
# Backup
export DATABASE_URL=''

pg_dump \
  -d "$DATABASE_URL" \
  -n drizzle \
  -x \
  > ./dump-migrations-$(date -u '+%Y.%m.%d-%H%M').sql

# Restore
psql \
  -d "$DATABASE_URL" \
  < ./dump-migrations-<date>.sql
```
