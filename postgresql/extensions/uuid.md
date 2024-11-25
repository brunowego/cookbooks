# UUID Extension

## Create

```sh
psql "$DATABASE_URL" -c 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp" SCHEMA public;'
```
