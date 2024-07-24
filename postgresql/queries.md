# PostgreSQL Queries

<!--
https://www.datadoghq.com/blog/postgresql-monitoring-tools/
-->

## Commands

```sql
-- Show version
\echo :VERSION

-- List databases
\list

-- Connect
\connect [db-name]

-- List users
\du+

-- Change password
\password [username]

-- List tables
\dt

-- Quit
\q
```

## SQL

### TBD

```sql
UPDATE <table-name> SET <column2-name> = <column1-name> WHERE <condition>;
```

### Common

```sql
-- Show config file location
SHOW config_file;

-- Show version
SELECT version();
SHOW server_version;

-- Show max simultaneous connections
SHOW max_connections;
SHOW shared_buffers;
```

### Drop Tables

```sql
-- Recreate the schema
DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

-- Restore default permissions
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO public;
```

## Tips

### Incrise Max Connections

```sh
#
postgres \
  -c 'shared_buffers=3GB' \
  -c 'max_connections=1000'

#
postgres \
  -B 3GB \
  -N 1000

#
sed -i '/^max_connections/s/100/1000/' /var/lib/postgresql/data/postgresql.conf
sed -i '/^shared_buffers/s/128MB/3GB/' /var/lib/postgresql/data/postgresql.conf

#
docker exec -i postgresql /bin/sh << \EOSHELL
sed -i '/^max_connections/s/100/1000/' /var/lib/postgresql/data/postgresql.conf
sed -i '/^shared_buffers/s/128MB/3GB/' /var/lib/postgresql/data/postgresql.conf
EOSHELL
```

### Show Stat Activity

```sql
SELECT * FROM pg_stat_activity;

SELECT count(*) FROM pg_stat_activity;
```
