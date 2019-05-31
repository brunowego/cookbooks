# Web

## With Config

Edit `/etc/proxysql.cnf` and add:

```cnf
admin_variables =
{
	web_enabled = true
	stats_credentials = "stats:stats"
}
```

```sh
mysql -h 127.0.0.1 -P 6032 -u admin -padmin --execute 'LOAD ADMIN VARIABLES FROM CONFIG; LOAD ADMIN VARIABLES TO RUNTIME; SAVE ADMIN VARIABLES TO DISK'
```

## User Interface

- [ProxySQL](http://[hostname]:6080)
