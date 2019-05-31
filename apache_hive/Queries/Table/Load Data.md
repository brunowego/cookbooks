# Load Data

## From flat files into Hive

```sql
LOAD DATA LOCAL INPATH './some/local/path/data.txt' OVERWRITE INTO TABLE [name];
```

## From flat files into Hive using a static partition

```sql
LOAD DATA LOCAL INPATH './some/local/path/data.txt' OVERWRITE INTO TABLE [name] PARTITION ([field]='partitionValue');
```

## Copy data to the table's directory in HDFS

```sh
hdfs dfs -mv [/some/hdfs/path] [/the/table/path]
```
