# Table

```sql
SET hive.exec.dynamic.partition = true;
SET hive.exec.dynamic.partition.mode = nonstrict;
SET hive.exec.max.dynamic.partitions = 10000;
SET hive.exec.max.dynamic.partitions.pernode = 1000;
SET hive.enforce.bucketing = true;
```

##

TODO

```sql
SET hive.execution.engine = mr;
SET hive.execution.engine = tez;
SET hive.execution.engine = spark;
```

## Impala metadata

```sql
INVALIDATE METADATA;
```

### Table

```sql
REFRESH [name];
```

```sql
INVALIDATE METADATA [name];
```
