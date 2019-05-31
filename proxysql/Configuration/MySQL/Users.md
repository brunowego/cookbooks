# Users

```sh
sudo tee -a /etc/proxysql.cnf << EOF
mysql_users =
(
	{
		username = "user",
		password = "user",
		default_hostgroup = 0,
		active = 1
	}
)

EOF
```

```sh
mysql -h 127.0.0.1 -P 6032 -u admin -padmin --execute 'SELECT * FROM disk.mysql_users'
mysql -h 127.0.0.1 -P 6032 -u admin -padmin --execute 'SELECT * FROM runtime_mysql_users'
```

```sh
mysql -h 127.0.0.1 -P 6032 -u admin -padmin --execute 'LOAD MYSQL USERS FROM CONFIG; LOAD MYSQL USERS TO RUNTIME; SAVE MYSQL USERS TO DISK'
```

```sh
mysql -h 127.0.0.1 -P 6033 -u user -puser
```
