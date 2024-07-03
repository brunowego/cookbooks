# Neon Backup

## Links

- Docs
  - [Backups](https://github.com/neondatabase/website/blob/main/content/docs/manage/backups.md?plain=1)

## Learn

- [nesin.io / How to backup and restore Neon.tech Postgres database](https://nesin.io/blog/backup-restore-neon-tech-postgres-database)
- [SimpleBackups / How to Backup Neon Database](https://simplebackups.com/blog/how-to-backup-neon)

## CLI

### Commands

```sh
npx @neondatabase/pg-import@latest -h
```

### Tips

#### pg_dump

```sh
#
export TIMESTAMP="$(date -u +'%Y-%m-%d-%H-%M-%S')"
export DATABASE_URL=''

#
npx @neondatabase/pg-import@latest \
  --accept-all true \
  --source "$DATABASE_URL" \
  --backup-file-path ./"${TIMESTAMP}.sql.gz"
```

#### Restore

```sh
#
export DATABASE_URL=''

#
psql "$DATABASE_URL" < ./<filename>.sql
# or
pg_restore -d "$DATABASE_URL" -Fc --single-transaction --section data ./<filename>.sql.gz
```

<!--
pre-data, data, post-data
-->

### Issues

#### TBD

```log
pg_restore: error: could not execute query: ERROR:  type "membership_role" already exists
```

TODO
