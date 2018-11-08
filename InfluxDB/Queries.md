# Queries

## Database

### Show

```sql
SHOW DATABASES
```

### Use

```sql
USE [db-name]
```

### Create

```sql
CREATE DATABASE [db-name]
```

### Drop

```sql
DROP DATABASE [db-name]
```

## Retention

### Show

```sql
SHOW RETENTION POLICIES
```

```sql
SHOW RETENTION POLICIES ON [db-name]
```

### Create

```sql
CREATE RETENTION POLICY [rp-name] ON [db-name] DURATION [duration] REPLICATION [number] [DEFAULT]
```

### Alter

```sql
ALTER RETENTION POLICY [rp-name] ON [db-name] (DURATION [duration] | REPLICATION [number] | DEFAULT)+
```

### Drop

#### Series

```sql
DROP SERIES FROM [table-name] WHERE [field] = '[value]'
```

#### Retention

```sql
DROP RETENTION POLICY [rp-name] ON [db-name]
```

## Measurements

### Show

```sql
SHOW MEASUREMENTS
```

### Select

```sql
SELECT * FROM [m-name]
```

#### From retention

```sql
SELECT * FROM [rp-name].[m-name]
```

### Field

```sql
SHOW FIELD KEYS FROM [m-name]
```
