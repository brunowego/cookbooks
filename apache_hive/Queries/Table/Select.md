# Select

```sql
SELECT [field] FROM [name] WHERE [field]='[value]';
```

## Group by

```sql
FROM [name] INSERT OVERWRITE TABLE otherTableName SELECT field2, count(*) WHERE field1 > 0 GROUP BY field2;

INSERT OVERWRITE TABLE otherTableName SELECT field2, count(*) FROM [name] WHERE field1 > 0 GROUP BY field2;
```
