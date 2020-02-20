# Create

```sql
CREATE TABLE [name] ([field] INT, [field] STRING);
```

## Partitioned

```sql
CREATE TABLE [name] ([field] INT, [field] STRING)
  PARTITIONED BY ([field] STRING)
  ROW FORMAT DELIMETED
  FIELDS TERMINATED BY ',';
```

## Stored as text

```sql
CREATE TABLE [name] ([field] INT, [field] STRING)
  ROW FORMAT DELIMETED
  FIELDS TERMINATED BY '\t'
  STORED AS TEXTFILE;
```

## Stored as sequence file

```sql
CREATE TABLE [name] ([field] INT, [field] STRING)
  STORED AS SEQUENCEFILE;
```

## Stored as avro

```sql
CREATE TABLE [name]
  STORED AS AVRO
  TBLPROPERTIES (
    'avro.schema.literal' = '{
      "name": "order",
      "type": "record",
      "fields": [
        { "name": "order_id", "type": "int" },
        { "name": "cust_id", "type": "int" },
        { "name": "order_date", "type": "string" }
      ]
    }'
  );
```

```sql
CREATE EXTERNAL TABLE [name]
  STORED AS AVRO
  TBLPROPERTIES ('avro.schema.url' = 'hdfs:/loudacre/sqoop_import_accounts.avsc')
  LOCATION '/user/hive/warehouse/[name]';
```

## Stored as avro, with snappy compression

```sql
SET hive.exec.compress.output=true;
SET avro.output.codec=snappy;

CREATE TABLE [name]
  STORED AS AVRO
  TBLPROPERTIES (
    'avro.schema.literal' = '{
      "name": "order",
      "type": "record",
      "fields": [
        { "name": "order_id", "type": "int" },
        { "name": "cust_id", "type": "int" },
        { "name": "order_date", "type": "string" }
      ]
    }',
    'avro.output.codec' = 'snappy',
    'hive.exec.compress.output' = 'true'
  );
```

## Stored as parquet

```sql
CREATE TABLE [name]
  STORED AS PARQUET;
```

## Stored as parquet, with compression set to snappy

```sql
CREATE TABLE [name]
  STORED AS PARQUET;

SET PARQUET_COMPRESSION_CODEC=snappy;
-- or
SET parquet.compression=snappy
```

```sql
CREATE TABLE [name]
  STORED AS PARQUET
  TBLPROPERTIES ('parquet.compression' = 'snappy');
```

## Store at specified location

```sql
CREATE TABLE [name] ([field] INT, [field] STRING)
  ROW FORMAT DELIMETED
  FIELDS TERMINATED BY ','
  STORED AS TEXTFILE
  LOCATION '/some/hdfs/path';
```

## Based on external data

```sql
CREATE EXTERNAL TABLE [name] ([field] INT, [field] STRING)
  LOCATION '/some/hdfs/path'
```

## Based on an existing table definition

```sql
CREATE TABLE [name] LIKE [name];
```

## As select

```sql
CREATE TABLE [name] AS SELECT [field], [field], [field] FROM [name] WHERE [field] = '[value]';
```
