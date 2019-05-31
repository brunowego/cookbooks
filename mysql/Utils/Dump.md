# Dump

## To file

```sh
mysqldump \
  -h [host] \
  -P 3306 \
  -u [username] \
  -p[password] \
  --databases [database] \
  > [filename].sql
```

## To PostgreSQL

```sh
mysqldump \
  -h [host] \
  -P 3306 \
  -u [username] \
  -p[password] \
  --databases [database]
  --extended-insert=FALSE \
  --no-create-info \
  --compact \
  --compatible=postgresql
  > [filename].sql
```
