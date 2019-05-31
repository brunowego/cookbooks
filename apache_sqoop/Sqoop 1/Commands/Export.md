# Export

## Basic

```sh
sqoop export \
  --connect jdbc:mysql://[hostname]:3306/[db-name] \
  --username [username] \
  --password [password] \
  --table [name] \
  --export-dir '[/some/hdfs/dir]'
```

--direct

## Columns

```sh
sqoop export \
  --connect jdbc:mysql://[hostname]:3306/[db-name] \
  --username [username] \
  --password [password] \
  --table [name] \
  --columns 'name,employee_id,jobtitle' \
  --export-dir '[/some/hdfs/dir]'
```

## Update

```sh
sqoop export \
  --connect jdbc:mysql://[hostname]:3306/[db-name] \
  --username [username] \
  --password [password] \
  --table [name] \
  --update-key 'id'
  --update-mode updateonly
  --export-dir '[/some/hdfs/dir]'
```

### Insert if missing

```sh
sqoop export \
  --connect jdbc:mysql://[hostname]:3306/[db-name] \
  --username [username] \
  --password [password] \
  --table [name] \
  --update-key 'id'
  --update-mode allowinsert
  --export-dir '[/some/hdfs/dir]'
```

## Specified field, and line terminators, and specified enclosure

```sh
sqoop export \
  --connect jdbs:mysql://[hostname]:3306/[db-name] \
  --username [username] \
  --password [password] \
  --table [name] \
  --input-enclosed-by \' \
  --input-fields-terminated-by \t \
  --input-lines-terminated-by \r
  --export-dir '[/some/hdfs/dir]'
```
