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

# Restore
# TODO
```
