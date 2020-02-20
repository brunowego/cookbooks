# Variables

```sh
sudo tee -a /etc/proxysql.cnf << EOF
admin_variables =
{
	admin_credentials = "admin:admin"
	mysql_ifaces = "0.0.0.0:6032"
	refresh_interval = 2000
}

EOF
```

```sh
mysql -h 127.0.0.1 -P 6032 -u admin -padmin --execute 'LOAD ADMIN VARIABLES FROM CONFIG; LOAD ADMIN VARIABLES TO RUNTIME'
```
