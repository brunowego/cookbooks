# Settings

## Tips

### TBD

```sh
#
export DATABASE_URL=postgresql://postgres:postgres@localhost:5432/postgres

#
psql -d "$DATABASE_URL" -c "SELECT name, setting, unit, category FROM pg_settings WHERE category LIKE 'Resource Usage%' OR category LIKE 'Query Tuning%' OR category LIKE 'Logging%' ORDER BY category, name;"
```
