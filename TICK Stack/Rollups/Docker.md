# Docker

## Volume

```sh
docker volume create rollups-influxdb-data
docker volume create rollups-influxdb-config
docker volume create rollups-kapacitor-data
docker volume create rollups-chronograf-data
docker volume create rollups-telegraf-config
```

## Running

```sh
docker run -d \
  -h influxdb.rollups.local \
  -v rollups-influxdb-data:/var/lib/influxdb \
  -v rollups-influxdb-config:/etc/influxdb \
  -p 8086:8086 \
  --name rollups-influxdb \
  --restart always \
  influxdb:1.7-alpine
```

```sh
docker exec -i rollups-influxdb /bin/sh << EOSHELL
cat << EOF >> /etc/influxdb/influxdb.conf

[http]
  flux-enabled = true

EOF
EOSHELL
```

```sh
docker exec -i rollups-influxdb influx -execute "$(cat << EOSQL
CREATE DATABASE system_stats
CREATE RETENTION POLICY twoweeks ON system_stats DURATION 2w REPLICATION 1
CREATE RETENTION POLICY forever ON system_stats DURATION Inf REPLICATION 1
EOSQL
)"
```

```sh
docker exec -i rollups-influxdb /bin/sh << EOSHELL
cat << EOF > /tmp/continuous-query.txt
CREATE CONTINUOUS QUERY "rollup_1h" ON "system_stats" RESAMPLE EVERY 1m BEGIN SELECT mean(*) INTO forever.cpu FROM twoweeks.cpu GROUP BY time(1h) END

EOF
EOSHELL
```

```sh
docker exec -i rollups-influxdb /bin/bash -c 'cat /tmp/continuous-query.txt | influx -database system_stats'
```

```sh
docker run -d \
  -h kapacitor.rollups.local \
  -e KAPACITOR_INFLUXDB_0_URLS_0=http://rollups-influxdb:8086 \
  -v rollups-kapacitor-data:/var/lib/kapacitor \
  -p 9092:9092 \
  --name rollups-kapacitor \
  --restart always \
  --link rollups-influxdb \
  kapacitor:1.5-alpine
```

```sh
docker run -d \
  -h chronograf.rollups.local \
  -v rollups-chronograf-data:/var/lib/chronograf \
  -p 8888:8888 \
  --name rollups-chronograf \
  --restart always \
  --link rollups-influxdb \
  --link rollups-kapacitor \
  chronograf:1.7-alpine --influxdb-url=http://rollups-influxdb:8086 --kapacitor-url=http://rollups-kapacitor:9092
```

```sh
docker run -d \
  -h telegraf.rollups.local \
  -v rollups-telegraf-config:/etc/telegraf \
  -p 6514:6514/udp \
  --name rollups-telegraf \
  --restart always \
  --link rollups-influxdb \
  telegraf:1.10-alpine
```

```sh
docker exec -i rollups-telegraf /bin/sh << EOSHELL
cat << EOF > /etc/telegraf/telegraf.conf
[agent]
  interval = "1s"
  debug = true

[[inputs.system]]
[[inputs.cpu]]
[[inputs.mem]]

[[outputs.influxdb]]
  urls = ["http://rollups-influxdb:8086"]
  database = "system_stats"
  retention_policy = "twoweeks"

EOF
EOSHELL
```

```sh
docker restart rollups-telegraf
```

```sh
echo -e "[INFO]\thttp://$(docker-machine ip):8888"
```

## Remove

```sh
docker rm -f rollups-influxdb rollups-kapacitor rollups-chronograf rollups-telegraf
docker volume rm rollups-influxdb-data rollups-influxdb-config rollups-kapacitor-data rollups-chronograf-data rollups-telegraf-config
```
