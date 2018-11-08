# Tips

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

## Comment Locks

```sh
sed -i 's/^LOCK\ TABLES/\-\-\ LOCK\ TABLES/g' [filename]
```

```sh
sed -i 's/^UNLOCK\ TABLES/\-\-\ UNLOCK\ TABLES/g' [filename]
```
