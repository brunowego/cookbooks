# Scheduler

```sh
sudo tee -a /etc/proxysql.cnf << EOF
scheduler =
(
	{
		id = 1
		active = 0
		interval_ms = 10000
		filename = "/var/lib/proxysql/proxysql_galera_checker.sh"
		arg1 = "0"
		arg2 = "0"
		arg3 = "0"
		arg4 = "1"
		arg5 = "/var/lib/proxysql/proxysql_galera_checker.log"
	}
)

EOF
```

```sh
mysql -h 127.0.0.1 -P 6032 -u admin -padmin --execute 'SELECT * FROM disk.scheduler'
mysql -h 127.0.0.1 -P 6032 -u admin -padmin --execute 'SELECT * FROM runtime_scheduler'
```

```sh
mysql -h 127.0.0.1 -P 6032 -u admin -padmin --execute 'LOAD SCHEDULER FROM CONFIG; LOAD SCHEDULER TO RUNTIME'
```
