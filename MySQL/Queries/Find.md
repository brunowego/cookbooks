# Find

## Duplicates

```sql
SELECT DISTINCT(column_name) AS column, COUNT(column_name) AS columnCount FROM table_name GROUP BY column_name HAVING columnCount > 1
```
