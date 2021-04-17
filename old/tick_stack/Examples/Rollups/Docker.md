# Docker

## Volume

```sh
docker volume create example-influxdb-data
docker volume create example-influxdb-config
docker volume create example-kapacitor-data
docker volume create example-chronograf-data
docker volume create example-telegraf-config
```

## Running

```sh
docker run -d \
  -h influxdb \
  -v example-influxdb-data:/var/lib/influxdb \
  -v example-influxdb-config:/etc/influxdb \
  -p 8086:8086 \
  --name example-influxdb \
  influxdb:1.7-alpine
```

```sh
docker exec -i example-influxdb /bin/sh << EOSHELL
cat << EOF >> /etc/influxdb/influxdb.conf

[http]
  flux-enabled = true

EOF
EOSHELL
```

```sh
docker exec -i example-influxdb influx -execute "$(cat << EOSQL
CREATE DATABASE system_stats
CREATE RETENTION POLICY twoweeks ON system_stats DURATION 2w REPLICATION 1
CREATE RETENTION POLICY forever ON system_stats DURATION Inf REPLICATION 1
EOSQL
)"
```

```sh
docker exec -i example-influxdb /bin/sh << EOSHELL
cat << EOF > /tmp/continuous-query.txt
CREATE CONTINUOUS QUERY "rollup_1h" ON "system_stats" RESAMPLE EVERY 1m BEGIN SELECT mean(*) INTO forever.cpu FROM twoweeks.cpu GROUP BY time(1h) END

EOF
EOSHELL
```

```sh
docker exec -i example-influxdb /bin/bash -c 'cat /tmp/continuous-query.txt | influx -database system_stats'
```

```sh
docker run -d \
  -h kapacitor \
  -e KAPACITOR_INFLUXDB_0_URLS_0=http://example-influxdb:8086 \
  -v example-kapacitor-data:/var/lib/kapacitor \
  -p 9092:9092 \
  --name example-kapacitor \
  kapacitor:1.5-alpine
```

```sh
docker run -d \
  -h chronograf \
  -v example-chronograf-data:/var/lib/chronograf \
  -p 8888:8888 \
  --name example-chronograf \
  chronograf:1.7-alpine --influxdb-url=http://example-influxdb:8086 --kapacitor-url=http://example-kapacitor:9092
```

```sh
docker run -d \
  -h telegraf \
  -v example-telegraf-config:/etc/telegraf \
  -p 6514:6514/udp \
  --name example-telegraf \
  telegraf:1.10-alpine
```

```sh
docker exec -i example-telegraf /bin/sh << EOSHELL
cat << EOF > /etc/telegraf/telegraf.conf
[agent]
  interval = "1s"
  debug = true

[[inputs.system]]
[[inputs.cpu]]
[[inputs.mem]]

[[outputs.influxdb]]
  urls = ["http://example-influxdb:8086"]
  database = "system_stats"
  retention_policy = "twoweeks"

EOF
EOSHELL
```

```sh
docker restart example-telegraf
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8888'
```

## Remove

```sh
docker rm -f example-influxdb example-kapacitor example-chronograf example-telegraf
docker volume rm example-influxdb-data example-influxdb-config example-kapacitor-data example-chronograf-data example-telegraf-config
```
