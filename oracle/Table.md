# Table

## Grant

```sql
GRANT ALL ON table TO username;
```

## Update

```sql
UPDATE table SET column = LTRIM(RTRIM(column));

UPDATE table SET column = REPLACE(column, ' ', '');
```

## Show privileges

```sql
SELECT * FROM all_tab_privs;
SELECT * FROM dba_sys_privs;
SELECT * FROM dba_role_privs;
```

## Create

```sql
CREATE SYNONYM TABLE FOR UserA.TABLE;
```
