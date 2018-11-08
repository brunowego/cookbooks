# Query Rules

```sh
sudo tee -a /etc/proxysql.cnf << EOF
mysql_query_rules:
(
	{
		rule_id = 1
		active = 1
		match_pattern = "^SELECT .* FOR UPDATE$"
		destination_hostgroup = 0
		apply = 1
	},
	{
		rule_id = 2
		active = 1
		match_pattern = "^SELECT"
		destination_hostgroup = 1
		apply = 1
	}
)

EOF
```

```sh
mysql -h 127.0.0.1 -P 6032 -u admin -padmin --execute 'SELECT * FROM disk.mysql_query_rules'
mysql -h 127.0.0.1 -P 6032 -u admin -padmin --execute 'SELECT * FROM runtime_mysql_query_rules'
```

```sh
mysql -h 127.0.0.1 -P 6032 -u admin -padmin --execute 'SELECT * FROM disk.mysql_query_rules_fast_routing'
mysql -h 127.0.0.1 -P 6032 -u admin -padmin --execute 'SELECT * FROM runtime_mysql_query_rules_fast_routing'
```

```sh
mysql -h 127.0.0.1 -P 6032 -u admin -padmin --execute 'LOAD MYSQL QUERY RULES FROM CONFIG; LOAD MYSQL QUERY RULES TO RUNTIME'
```
