# Slow Query Log

## Enable

```sql
SHOW VARIABLES LIKE 'slow_query_log';
```

```sql
SET GLOBAL slow_query_log = 'ON';
```

## Indexes

```sql
SHOW VARIABLES LIKE 'log_queries_not_using_indexes';
```

```sql
SET GLOBAL log_queries_not_using_indexes = 'ON';
```

## Log File

```sql
SHOW VARIABLES LIKE 'slow_query_log_file';
```

```sql
SET GLOBAL slow_query_log_file = '/var/log/mysql/slow-query.log';
```

## Query Time

```sql
SHOW VARIABLES LIKE 'long_query_time';
```

```sql
SET GLOBAL long_query_time = 20;
```
