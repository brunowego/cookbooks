# Retention

## Show

```sql
SHOW RETENTION POLICIES
```

```sql
SHOW RETENTION POLICIES ON [db-name]
```

## Create

```sql
CREATE RETENTION POLICY [rp-name] ON [db-name] DURATION [duration] REPLICATION [number] [DEFAULT]
```

## Alter

```sql
ALTER RETENTION POLICY [rp-name] ON [db-name] (DURATION [duration] | REPLICATION [number] | DEFAULT)+
```

## Drop

```sql
DROP RETENTION POLICY [rp-name] ON [db-name]
```
