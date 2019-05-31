# Import

## Basic

```sh
sqoop import \
  --connect jdbc:mysql://[hostname]:3306/[db-name] \
  --username [username] \
  --password [password] \
  --table [name] \
  --warehouse-dir '[/some/hdfs/dir]'
```

> Use `--direct` option to increase performance.

## All tables

```sh
sqoop import-all-tables \
  --connect jdbc:mysql://[hostname]:3306/[db-name] \
  --username [username] \
  --password [password] \
  --warehouse-dir '[/some/hdfs/dir]'
```

## Parameters

```sh
sqoop import \
  -m #mappers \

  --columns 'name,employee_id,jobtitle' \
  --query "SELECT * FROM tableName WHERE $CONDITIONS AND name = Joe" \
  --where 'name = Joe' \
  --enclosed-by \" \
  --fields-terminated-by \t \
  --lines-terminated-by \r \

  --incremental append \
  --check-column 'id' \

  --incremental lastmodified \
  --last-value '2018-01-01' \
  --check-column 'date' \

  --as-textfile \
  --as-avrodatafile \
  --as-parquetfile \
  --as-sequencefile \

  --compression-codec 'gzip' \
  --compression-codec 'bzip2' \
  --compression-codec 'snappy' \

  --compress \

  --map-column-hive \

  --hive-import \
  --hive-database \
  --hive-overwrite \
  --hive-home /user/hive/warehouse \
  --hive-table 'otherTableName' \
  --hive-partition-key 'state' \
  --hive-partition-value 'MD' \
  --create-hive-table \

  --split-by id \
  --columns id,name \
  --table customer \
  --target-dir '[/some/hdfs/dir]' \
  --fields-terminated-by ',' \
  --exclude-tables \

  --verbose
```
