# Log

## General

```sh
mysql -ve 'SHOW VARIABLES LIKE "general_log%"' -u root -p
```

```sh
mysql -ve 'SET GLOBAL general_log="ON"' -u root -p
```

```sh
tail -f /var/lib/mysql/mysql.log
```

```sh
mysql -ve 'SET GLOBAL general_log="OFF"' -u root -p
```
