# Supabase Backup

## Learn

- [How to backup and restore Supabase Postgres database](https://nesin.io/blog/backup-restore-supabase-postgres-database)
- [Restore PostgreSQL DB via a dump.gz file with gunzip and psql](https://www.stevenchang.tw/blog/2023/07/05/restore-db-via-a-dump-file-with-gunzip)

<!--
https://simplebackups.com/blog/how-to-backup-supabase

https://github.com/orgs/supabase/discussions/26664

https://gist.github.com/atenni/a73cfbec1b7fd367b833
https://stackoverflow.com/questions/75251120/postgresql-restore-with-compressed-dump-file
-->

## Download Backup

1. [Supabase Projects](https://supabase.com/dashboard/projects)
2. Select a project
3. Mein Menu -> Database
4. Aside Menu -> Platform -> Backups
5. Database Backups -> Scheduled backups (Tab) -> Select one -> Download

## Restore Backup (Local)

```sh
#
gunzip <filename>.backup.gz

#
file --mime-type <filename>.backup

#
head -n 20 <filename>.backup

#
sed -i 's/^\(\\connect postgres\)$/\\connect acme/' <filename>.backup

#
export DATABASE_URL='postgresql://acme:acme@localhost:5432/acme'

#
psql -d "$DATABASE_URL" -c 'ALTER USER acme WITH SUPERUSER'

#
psql -d "$DATABASE_URL" < ./<filename>.backup
```

## Issues

### TBD

```log
ERROR:  relation "pgsodium.key" does not exist
```

TODO
