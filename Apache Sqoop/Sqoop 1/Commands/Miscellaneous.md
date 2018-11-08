# Miscellaneous

## Hive table without any data

```sh
sqoop create-hive-table \
  --connect jdbc:mysql://[hostname]:3306/[db-name] \
  --username [username] \
  --password [password] \
  --table 'sqlTable' \
  --hive-table 'hiveTable'
```

## Evaluate a statement against a database

```sh
sqoop eval \
  --connect jdbc:mysql://[hostname]:3306/[db-name] \
  --username [username] \
  --password [password] \
  --query 'SELECT * FROM [table-name] LIMIT 10'
```

## List Databases available on a server

```sh
sqoop list-databases \
  --connect jdbc:mysql://[hostname]:3306 \
  --username [username] \
  --password [password]
```

## List tables available within a database

```sh
sqoop list-tables \
  --connect jdbc:mysql://[hostname]:3306/[db-name] \
  --username [username] \
  --password [password]
```
