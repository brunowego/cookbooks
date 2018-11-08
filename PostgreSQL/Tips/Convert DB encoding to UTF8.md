# Convert DB encoding to UTF8

## Export database

```sql
postgres pg_dump --encoding utf8 main -f main.sql
```

Create a new database

```sql
createdb -E utf8 newMmain
```

Import SQL file

```sql
psql -f main.sql -d newMain
```
