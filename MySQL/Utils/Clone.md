# Clone

##

```sh
mysql \
  -h [host] \
  -P 3306 \
  -u [username] \
  -p \
  -ve 'CREATE DATABASE IF NOT EXISTS [db-name]'
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
