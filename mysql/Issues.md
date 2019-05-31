# Issues

## GTID

> ERROR 1193 (HY000): Unknown system variable 'GTID_PURGED'

```sh
mysqldump \
  -h [host] \
  -P 3306 \
  -u [username] \
  -p[password] \
  --set-gtid-purged OFF \
  --databases [database] \
  > [filename]
```

## Authentication plugin

> Unable to load authentication plugin 'caching_sha2_password'.

```sh
mysqld --default-authentication-plugin=mysql_native_password
```
