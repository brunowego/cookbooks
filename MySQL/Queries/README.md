# Queries

## Character Set

```sql
SELECT @@character_set_database;
```

## Variables

###

```sql
SHOW VARIABLES LIKE 'log_slow_rate%';
SHOW VARIABLES LIKE 'long_query_time';
```

## Database

### Current

```sql
SELECT DATABASE();
```

## Get Size

### Megabyte

```sql
SELECT table_schema AS "Database", SUM(data_length + index_length) / 1024 / 1024 AS "Size (MB)" FROM information_schema.TABLES GROUP BY table_schema;
```

### Gigabyte

```sql
SELECT table_schema AS "Database", SUM(data_length + index_length) / 1024 / 1024 / 1024 AS "Size (GB)" FROM information_schema.TABLES GROUP BY table_schema;
```

## Uptime

```sql
SELECT TIME_FORMAT(SEC_TO_TIME(VARIABLE_VALUE ), '%Hh %im') AS Uptime FROM performance_schema.global_status WHERE VARIABLE_NAME='Uptime';
```

## Rows Count

```sql
SELECT
  TABLE_NAME,
  TABLE_ROWS
FROM
  `information_schema`.`tables`
WHERE
  `table_schema` = '[dbname]';
```
