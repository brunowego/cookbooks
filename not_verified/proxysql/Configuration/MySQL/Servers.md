# Servers

```sh
sudo tee -a /etc/proxysql.cnf << EOF
mysql_servers =
(
	{
		address = "127.0.0.1",
		port = 3306,
		hostgroup = 0,
    max_connections = 100
	}
)

EOF
```

```sh
mysql -h 127.0.0.1 -P 6032 -u admin -padmin --execute 'SELECT * FROM disk.mysql_servers'
mysql -h 127.0.0.1 -P 6032 -u admin -padmin --execute 'SELECT * FROM runtime_mysql_servers'
```

```sh
mysql -h 127.0.0.1 -P 6032 -u admin -padmin --execute 'LOAD MYSQL SERVERS FROM CONFIG; LOAD MYSQL SERVERS TO RUNTIME; SAVE MYSQL SERVERS TO DISK'
```

##

```sh
mysql -h 127.0.0.1 -P 6032 -u admin -padmin --force --execute '
  INSERT INTO mysql_servers (
    hostgroup_id,
    hostname,
    port,
    max_connections,
    max_replication_lag
  ) VALUES (
    0,
    "127.0.0.1",
    3306,
    100,
    0
  );
'
```
