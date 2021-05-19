# PostgreSQL Queries

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

```sql
-- Show version
SELECT version();
SHOW server_version;
```
