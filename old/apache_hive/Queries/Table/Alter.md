# Alter

```sql
ALTER TABLE [name]
  ADD PARTITION (partField='partValue')
  LOCATION '/hdfs/path/to/[name]/partValue';
```

```sql
ALTER TABLE [name]
  DROP PARTITION (partField='partValue');
```

```sql
ALTER TABLE [name]
  RENAME TO otherTableName;
```

```sql
ALTER TABLE [name]
  ADD COLUMNS ([field] INT, [field] STRING);
```

```sql
ALTER TABLE [name]
  REPLACE COLUMNS ([field] INT, [field] STRING, [field] INT);
```
