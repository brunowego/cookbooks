# PostgreSQL Owner Queries

```sql
-- Show table owners
SELECT table_schema,
       table_name,
       grantee,
       privilege_type
FROM information_schema.role_table_grants
WHERE table_schema NOT IN ('pg_catalog', 'information_schema')
ORDER BY table_schema, table_name, grantee;

-- Show table owners
SELECT schemaname,
       tablename,
       tableowner
FROM pg_tables
WHERE schemaname NOT IN ('pg_catalog', 'information_schema')
ORDER BY schemaname, tablename;

-- Show table owners
SELECT n.nspname AS schema_name,
       c.relname AS table_name,
       r.rolname AS owner,
       c.relacl AS raw_acl
FROM pg_class c
JOIN pg_namespace n ON n.oid = c.relnamespace
JOIN pg_roles r ON r.oid = c.relowner
WHERE c.relkind = 'r'  -- 'r' = regular table
  AND n.nspname NOT IN ('pg_catalog', 'information_schema')
ORDER BY n.nspname, c.relname;
```
