# Import

## From file

```sh
mysql \
  -h [host] \
  -P 3306 \
  -u [username] \
  -p[password] \
  [database] \
  < [filename].sql
```

### Alternative

```sh
mysqlimport \
  -h [host] \
  -P 3306 \
  -u [username] \
  -p[password] \
  [database] \
  [filename].sql
```
