# PostgreSQL Performance

<!--
https://github.com/timescale/promscale

Telemetry

https://docs.percona.com/percona-operator-for-postgresql/telemetry.html
https://percona.com/software/percona-kubernetes-operators

Amazon Performance Insights
-->

**Keywords:** Troubleshoot, Optimize Inefficient Queries

## Tools

- [Datadog / RDS Performance Monitoring](https://datadoghq.com/dg/monitor/rds-benefits)

<!--
https://supabase.com/dashboard/project/<project-id>/advisors/performance

https://pganalyze.com
-->

## Queries

### Database size

```sql
SELECT pg_size_pretty(pg_database_size(current_database())) AS size;
```

### Tables without autoanalyze

```sql
-- Run autoanalyze
ANALYZE;

-- Show autoanalyze settings
SHOW autovacuum;

-- Check if autoanalyze is enabled
SELECT
  relname,
  last_analyze,
  last_autoanalyze
FROM
  pg_stat_user_tables
ORDER BY
  last_analyze DESC NULLS LAST;

-- Vacuum and analyze running queries
SELECT
  pid,
  datname,
  usename,
  state,
  now() - query_start AS running_time,
  query
FROM
  pg_stat_activity
WHERE
  query ILIKE '%vacuum%' OR query ILIKE '%analyze%'
ORDER BY
  running_time DESC;
```

### Disk usage per table (very large tables)

```sql
SELECT
  relname AS table_name,
  pg_size_pretty(pg_total_relation_size(relid)) AS total_size,
  pg_size_pretty(pg_relation_size(relid)) AS data_size,
  pg_size_pretty(pg_total_relation_size(relid) - pg_relation_size(relid)) AS index_size
FROM pg_catalog.pg_statio_user_tables
ORDER BY pg_total_relation_size(relid) DESC
LIMIT 10;
```

<!-- ```sql
SELECT
  relname AS table_name,
  pg_size_pretty(pg_total_relation_size(relid)) AS total_size
FROM pg_catalog.pg_statio_user_tables
ORDER BY pg_total_relation_size(relid) DESC
LIMIT 10;
``` -->

### Heavier queries (planning and execution time)

```sql
SELECT
  query,
  calls,
  ROUND((total_exec_time / 1000)::numeric, 2) AS total_exec_time_sec,
  ROUND((mean_exec_time / 1000)::numeric, 4) AS mean_exec_time_sec,
  rows
FROM pg_stat_statements
ORDER BY total_exec_time DESC
LIMIT 30;
```

### View Locks and Stuck Queries

```sql
# Find all queries
SELECT
  pid,
  now() - query_start AS duration,
  state,
  wait_event_type,
  wait_event,
  query
FROM pg_stat_activity
ORDER BY duration DESC;

# Find idle queries
SELECT
  pid,
  now() - pg_stat_activity.query_start AS duration,
  state,
  wait_event_type,
  wait_event,
  query
FROM pg_stat_activity
WHERE state != 'idle'
ORDER BY duration DESC;
```

<!--
SELECT
  relation::regclass,
  mode,
  COUNT(*) AS count
FROM pg_locks
WHERE NOT granted
GROUP BY relation, mode
ORDER BY count DESC;
-->

<!--
SELECT
  pid,
  usename,
  state,
  backend_xid,
  backend_xmin,
  now() - xact_start AS xact_duration,
  now() - query_start AS query_duration,
  query
FROM pg_stat_activity
WHERE state != 'idle'
  AND xact_start IS NOT NULL
ORDER BY xact_duration DESC;
-->

### View CPU/IO/Memory Consumption by Query

```sql
# Find all queries
SELECT
  pid,
  usename,
  application_name,
  client_addr,
  backend_start,
  state,
  wait_event,
  query,
  now() - query_start AS duration
FROM pg_stat_activity
ORDER BY duration DESC;

# Find active queries
SELECT
  pid,
  usename,
  application_name,
  client_addr,
  backend_start,
  state,
  wait_event,
  query,
  now() - query_start AS duration
FROM pg_stat_activity
WHERE state = 'active'
ORDER BY duration DESC;
```

### View Inefficient or Unused Indexes

```sql
SELECT
  schemaname,
  relname AS table_name,
  indexrelname AS index_name,
  idx_scan AS index_scans
FROM pg_stat_user_indexes
WHERE idx_scan = 0
ORDER BY relname;
```

### View Tables with Bloat (Fragmentation)

```sql
SELECT
  schemaname,
  relname AS table_name,
  n_live_tup,
  n_dead_tup
FROM pg_stat_user_tables
ORDER BY n_dead_tup DESC;
```

### Number of connections per application or user

```sql
SELECT
  usename,
  application_name,
  count(*) AS connections
FROM pg_stat_activity
GROUP BY usename, application_name
ORDER BY connections DESC;
```

### Tables with missing index (Frequent Full Scan)

```sql
SELECT
  relname AS table_name,
  seq_scan,
  idx_scan,
  (100 * seq_scan / (seq_scan + idx_scan + 1))::NUMERIC(5,2) AS seq_scan_percent
FROM pg_stat_user_tables
ORDER BY seq_scan_percent DESC
LIMIT 10;
```

### Indexes by type

```sql
SELECT
  schemaname,
  tablename,
  indexname,
  indexdef,
  CASE
    WHEN indexdef ILIKE '%unique%' AND indexdef ILIKE '%primary key%' THEN 'automatic (PRIMARY KEY)'
    WHEN indexdef ILIKE '%unique%' THEN 'automatic (UNIQUE)'
    WHEN indexdef ILIKE '%exclude%' THEN 'automatic (EXCLUDE)'
    ELSE 'manual'
  END AS index_type
FROM pg_indexes
WHERE schemaname = 'public'
ORDER BY tablename, index_type DESC;
```

<!-- ```sql
SELECT
  CASE
    WHEN indexdef ILIKE '%primary key%' OR indexname ILIKE '%_pkey' THEN 'automatic'
    WHEN indexdef ILIKE '%unique%' THEN 'automatic'
    ELSE 'manual'
  END AS index_type,
  COUNT(*) AS total
FROM pg_indexes
WHERE schemaname = 'public'
GROUP BY index_type
ORDER BY index_type;
``` -->
