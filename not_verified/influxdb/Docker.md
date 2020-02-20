# Docker

## Volume

```sh
docker volume create influxdb-data
docker volume create influxdb-config
```

## Running

```sh
docker run -d \
  -h influxdb \
  -v influxdb-data:/var/lib/influxdb \
  -v influxdb-config:/etc/influxdb \
  -p 8086:8086 \
  --name influxdb \
  influxdb:1.7-alpine
```

```sh
docker exec -i influxdb /bin/sh << EOSHELL
cat << EOF > /tmp/ddl.txt
# DDL
CREATE DATABASE pirates
CREATE RETENTION POLICY oneday ON pirates DURATION 1d REPLICATION 1

EOF
EOSHELL
```

```sh
docker exec -i influxdb /bin/sh << EOSHELL
cat << EOF > /tmp/dml.txt
# DML
# CONTEXT-DATABASE: pirates
# CONTEXT-RETENTION-POLICY: oneday

treasures,captain_id=dread_pirate_roberts value=801
treasures,captain_id=flint value=29
treasures,captain_id=sparrow value=38
treasures,captain_id=tetra value=47
treasures,captain_id=crunch value=109

EOF
EOSHELL
```

```sh
docker exec -i influxdb influx -import -path=/tmp/ddl.txt -precision=s
docker exec -i influxdb influx -import -path=/tmp/dml.txt -precision=s
```

```sh
docker exec -i influxdb influx -database 'pirates' -execute 'SELECT * FROM oneday.treasures'
```

## Remove

```sh
docker rm -f influxdb
docker volume rm influxdb-data influxdb-config
```
