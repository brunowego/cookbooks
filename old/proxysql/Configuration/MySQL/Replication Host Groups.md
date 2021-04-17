# Replication Host Groups

```sh
sudo tee -a /etc/proxysql.cnf << EOF
mysql_replication_hostgroups =
(
	{
		writer_hostgroup = 30
		reader_hostgroup = 40
		comment = "test repl 1"
	},
	{
		writer_hostgroup = 50
		reader_hostgroup = 60
		comment = "test repl 2"
	}
)

EOF
```

```sh
mysql -h 127.0.0.1 -P 6032 -u admin -padmin --execute 'SELECT * FROM disk.mysql_replication_hostgroups'
mysql -h 127.0.0.1 -P 6032 -u admin -padmin --execute 'SELECT * FROM runtime_mysql_replication_hostgroups'
```

```sh
mysql -h 127.0.0.1 -P 6032 -u admin -padmin --execute 'SELECT * FROM disk.mysql_group_replication_hostgroups'
mysql -h 127.0.0.1 -P 6032 -u admin -padmin --execute 'SELECT * FROM runtime_mysql_group_replication_hostgroups'
```

```sh
mysql -h 127.0.0.1 -P 6032 -u admin -padmin --execute 'LOAD MYSQL REPLICATION HOSTGROUPS FROM CONFIG; LOAD MYSQL REPLICATION HOSTGROUPS TO RUNTIME'
```
