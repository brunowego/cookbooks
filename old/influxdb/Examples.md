# Commands

## Precision

```sh
influx -precision rfc3339
```

## Connect

```sh
influx -host [hostname] -port 8086
```

## Import

```sh
influx -host [hostname] -port 8086 -import -path=[/path/to/file.txt]
```

## Execute

```sh
influx -host [hostname] -port 8086 -execute 'SHOW DATABASES'
```

```sh
influx -host [hostname] -port 8086 -execute "$(cat << EOSQL

EOSQL
)"
```

##

```sh
curl \
  -G "http://127.0.0.1:8086/query?pretty=true" \
  --data-urlencode 'db=telegraf' \
  --data-urlencode 'q=SELECT * FROM cpu ORDER BY time DESC LIMIT 10'
```
