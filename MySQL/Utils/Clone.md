# Clone

##

```sh
mysql \
  -ve 'CREATE DATABASE IF NOT EXISTS [db-name]' \
  -h [host] \
  -P 3306 \
  -u [username] \
  -p
```

```sh
mysqldump \
  -h [host] \
  -P 3306 \
  -u [username] \
  --password=[password] \
  [db-name] | \
    mysql \
      -h [host] \
      -P 3306 \
      -u [username] \
      --password=[password] \
      [db-name] \
        &> /dev/null &
```

```sh
ps [pid]
```
