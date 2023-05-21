# PostgreSQL Logging

## Tips

### Log Statemen

```sql
SHOW log_statement;

ALTER system SET log_statement = 'all';

-- Restart PostgreSQL Server
```

<!--
log_statement=all
log_connections=on
log_disconnections=on
log_hostname=off
log_duration=on

log_destination = 'stderr,csvlog'
logging_collector = on
-->

### PG Stat Statements

```sql
ALTER SYSTEM SET shared_preload_libraries = 'pg_stat_statements';

SELECT extname FROM pg_extension WHERE extname = 'pg_stat_statements';

CREATE EXTENSION IF NOT EXISTS pg_stat_statements;

SELECT count(*) FROM pg_stat_statements;
```

<!--
SELECT * FROM pg_file_Settings WHERE name='shared_preload_libraries';

SELECT calls, query FROM pg_stat_statements LIMIT 1;

shared_preload_libraries = '`pg_stat_statements`'

track_activity_query_size = 2048

pg_stat_statements.track = all
-->
