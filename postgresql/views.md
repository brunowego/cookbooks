# Views

## Commands

```sh
#
psql -d "$DATABASE_URL" -c "\dv"

#
psql -d "$DATABASE_URL" -c "SELECT table_schema, table_name FROM information_schema.views WHERE table_schema NOT IN ('pg_catalog', 'information_schema');"

#
psql -d "$DATABASE_URL" -c "SELECT pid, usename, state, query FROM pg_stat_activity WHERE query LIKE '%<view-name>%' AND state = 'idle in transaction';"
```

## Tips

### TBD

```log
#
export DATABASE_URL=postgresql://postgres:postgres@localhost:5432/postgres

#
psql -d "$DATABASE_URL" -c '\l'

#
psql -d "$DATABASE_URL" -c "SELECT pid, usename, state, query FROM pg_stat_activity WHERE datname = 'postgres' AND state = 'idle in transaction';"
```
