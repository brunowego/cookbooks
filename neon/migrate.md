# Migrate

## From Backup to Neon

```sh
#
npx @neondatabase/pg-import@latest -h

#
export BACKUP_DATABASE_URL=''
export NEON_DATABASE_URL=''

#
psql "$BACKUP_DATABASE_URL" -c "SELECT version();"
psql "$NEON_DATABASE_URL" -c "SELECT version();"

#
npx @neondatabase/pg-import@latest \
  --accept-all true \
  --source "$BACKUP_DATABASE_URL" \
  --destination "$NEON_DATABASE_URL"
```

## Issues

### TBD

```log
Error: [@neondatabase/pg-import] Postgres version mismatch between source (16) and destination (17).
```

If possible try creating in Neon the database with the same version as the source database.

<!-- **Try migrating only the data:**

```sh
#
export TIMESTAMP="$(date -u +'%Y-%m-%d-%H-%M-%S')"
export BACKUP_DATABASE_URL=''

#
pg_dump \
  --data-only \
  --no-owner \
  --no-acl \
  --schema=public \
  -Fc \
  -v \
  --dbname="$BACKUP_DATABASE_URL" \
  > "./dump-${TIMESTAMP}-data-only.dump"

#
pg_restore \
  --no-owner \
  --no-acl \
  --clean \
  --if-exists \
  --disable-triggers \
  --verbose \
  -d "$NEON_DATABASE_URL" \
  "./dump-${TIMESTAMP}-data-only.dump"
``` -->
