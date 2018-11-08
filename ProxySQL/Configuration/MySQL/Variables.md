# Variables

```sh
sudo tee -a /etc/proxysql.cnf << EOF
mysql_variables =
{
	threads = 4
	max_connections = 2048
	default_query_delay = 0
	default_query_timeout = 36000000
	have_compress = true
	poll_timeout = 2000
	interfaces = "0.0.0.0:6033;/tmp/proxysql.sock"
	default_schema = "information_schema"
	stacksize = 1048576
	server_version = "5.7.25"
	connect_timeout_server = 3000
	monitor_username = "monitor"
	monitor_password = "monitor"
	monitor_history = 600000
	monitor_connect_interval = 60000
	monitor_ping_interval = 10000
	monitor_read_only_interval = 1500
	monitor_read_only_timeout = 500
	ping_interval_server_msec = 120000
	ping_timeout_server = 500
	commands_stats = true
	sessions_sort = true
	connect_retries_on_failure = 10
  eventslog_filename = "queries.log"
}

EOF
```

```sh
mysql -h 127.0.0.1 -P 6032 -u admin -padmin --execute 'SELECT * FROM disk.global_variables'
mysql -h 127.0.0.1 -P 6032 -u admin -padmin --execute 'SELECT * FROM runtime_global_variables'
```

```sh
mysql -h 127.0.0.1 -P 6032 -u admin -padmin --execute 'LOAD MYSQL VARIABLES FROM CONFIG; LOAD MYSQL VARIABLES TO RUNTIME'
```
