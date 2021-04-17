# Convert DB encoding to UTF8

## Export database

```sh
postgres pg_dump --encoding utf8 main -f main.sql
```

Create a new database

```sh
createdb -E utf8 newMmain
```

## Import SQL file

```sh
psql -f main.sql -d newMain
```
