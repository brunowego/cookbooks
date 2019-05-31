# Configuration

## Disk

```sh
mysql -h 127.0.0.1 -P 6032 -u admin -padmin --execute 'SELECT * FROM disk.mysql_collations'
mysql -h 127.0.0.1 -P 6032 -u admin -padmin --execute 'SELECT * FROM disk.proxysql_servers'
```

### Setting

```sh
mysql -h 127.0.0.1 -P 6032 -u admin -padmin --execute 'SET [variable]="[value]"; LOAD [OBJECT] TO RUNTIME; SAVE [OBJECT] TO DISK'
```

## Runtime

```sh
mysql -h 127.0.0.1 -P 6032 -u admin -padmin --execute 'SELECT * FROM runtime_checksums_values'
mysql -h 127.0.0.1 -P 6032 -u admin -padmin --execute 'SELECT * FROM runtime_proxysql_servers'
```

### Setting

```sh
mysql -h 127.0.0.1 -P 6032 -u admin -padmin --execute 'SET [variable]="[value]"; LOAD [OBJECT] TO RUNTIME'
```
