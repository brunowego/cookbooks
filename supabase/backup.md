# Supabase Backup

## Glossary

- Point-in-Time Recovery (PITR)
- Recovery Point Objective (RPO)
- Write Ahead Log (WAL)

## Learn

- [How to backup and restore Supabase Postgres database](https://nesin.io/blog/backup-restore-supabase-postgres-database)
- [Restore PostgreSQL DB via a dump.gz file with gunzip and psql](https://www.stevenchang.tw/blog/2023/07/05/restore-db-via-a-dump-file-with-gunzip)

<!--
https://supabase.com/blog/restore-to-a-new-project
-->

<!--
https://simplebackups.com/blog/how-to-backup-supabase

https://github.com/orgs/supabase/discussions/26664

https://gist.github.com/atenni/a73cfbec1b7fd367b833
https://stackoverflow.com/questions/75251120/postgresql-restore-with-compressed-dump-file
-->

## Download Backup

1. [Supabase Projects](https://supabase.com/dashboard/projects)
2. Select a project
3. Main Menu -> Database
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

## TBD

```sh
#
export PGHOST=''
export PGPORT=6543
export PGDATABASE='postgres'
export PGUSER=''
export PGPASSWORD=''

pg_dump --no-owner --no-acl --schema public -Fc -v > ./production.dump

# Or
export PRODUCTION_DATABASE_URL="postgresql://<username>:<password>@<host>:<port>/postgres"

pg_dump --no-owner --no-acl --schema public -Fc -v --dbname "$PRODUCTION_DATABASE_URL" > ./production.dump
```

```sh
#
pg_restore --list ./production.dump

#
export PGHOST=''
export PGPORT=6543
export PGDATABASE='postgres'
export PGUSER=''
export PGPASSWORD=''

#
pg_restore --verbose --clean --no-owner --no-acl --dbname "$PGDATABASE" --schema public ./production.dump

# Or
export STAGING_DATABASE_URL="postgresql://<username>:<password>@<host>:<port>/postgres"

pg_restore --verbose --clean --no-owner --no-acl --dbname "$STAGING_DATABASE_URL" --schema public ./production.dump
```

## Issues

### TBD

```log
pg_dump: error: Dumping the contents of table "block_attributes" failed: PQgetCopyData() failed.
pg_dump: detail: Error message from server: server closed the connection unexpectedly
	This probably means the server terminated abnormally
	before or while processing the request.
server closed the connection unexpectedly
	This probably means the server terminated abnormally
	before or while processing the request.
pg_dump: detail: Command was: COPY public.block_attributes (id, cvx_id, cvx_group_attribute_id, meta, monthly_values, cvx_organization_id, cvx_parent_block_id, cvx_parent_group_id, value, created_at, updated_at) TO stdout;
Error: Process completed with exit code 1.
```

<!--
https://docs.simplebackups.com/help-tips--troubleshooting/mQyMDHYQcVeYgoW6VN65u8/pg_dump-error-error-message-from-server-ssl-syscall-error-eof-detected/prT6mN2eGZAjGZznmih1Ad
-->

TODO

### TBD

```log
ERROR:  relation "pgsodium.key" does not exist
```

TODO
