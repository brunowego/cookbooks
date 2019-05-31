# Log

## General

```sh
mysql -u root -p -ve 'SHOW VARIABLES LIKE "general_log%"'
```

```sh
mysql -u root -p -ve 'SET GLOBAL general_log="ON"'
```

```sh
tail -f /var/lib/mysql/mysql.log
```

```sh
mysql -u root -p -ve 'SET GLOBAL general_log="OFF"'
```
