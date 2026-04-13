# Monitoring

## Tips

### TBD

```sql
--
SELECT * FROM pg_extension WHERE extname = 'pg_stat_statements';

--
CREATE EXTENSION IF NOT EXISTS pg_stat_statements;

--
SELECT pg_stat_statements_reset();
```
