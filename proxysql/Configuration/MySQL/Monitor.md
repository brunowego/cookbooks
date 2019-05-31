# Monitor

```sh
mysql -h 127.0.0.1 -P 6032 -u admin -padmin --execute 'USE monitor; SELECT * FROM mysql_users'
```

```sh
mysql -h 127.0.0.1 -P 6032 -u admin -padmin --execute 'SELECT * FROM monitor.mysql_server_connect_log ORDER BY time_start_us DESC LIMIT 10'
```

```sh
mysql -h 127.0.0.1 -P 6032 -u admin -padmin --execute 'SELECT * FROM monitor.mysql_server_ping_log ORDER BY time_start_us DESC LIMIT 10'
```
