# Queries

## Drop

```sql
SELECT CONCAT('DROP TABLE IF EXISTS `', table_name, '` CASCADE;')
FROM information_schema.TABLES
WHERE TABLE_SCHEMA = '[dbname]';
```

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
SELECT TABLE_SCHEMA AS "Database", SUM(data_length + index_length) / 1024 / 1024 AS "Size (MB)"
FROM information_schema.TABLES
GROUP BY TABLE_SCHEMA;
```

### Gigabyte

```sql
SELECT TABLE_SCHEMA AS "Database", SUM(data_length + index_length) / 1024 / 1024 / 1024 AS "Size (GB)"
FROM information_schema.TABLES
GROUP BY TABLE_SCHEMA;
```

## Uptime

```sql
SELECT TIME_FORMAT(SEC_TO_TIME(VARIABLE_VALUE ), '%Hh %im') AS Uptime
FROM performance_schema.global_status
WHERE VARIABLE_NAME='Uptime';
```

## Rows Count

```sql
SELECT TABLE_NAME, TABLE_ROWS
FROM information_schema.TABLES
WHERE TABLE_SCHEMA = '[dbname]';
```
