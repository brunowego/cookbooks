# Join

```sql
FROM [name] t1 JOIN otherTableName t2 ON (t1.field1 = t2.field2) INSERT OVERWRITE TABLE anotherTableName SELECT t1.field1 , t1.field2, t2.field2;
```
