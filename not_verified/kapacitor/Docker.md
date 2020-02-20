# Docker

## Volume

```sh
docker volume create kapacitor-influxdb-data
docker volume create kapacitor-influxdb-config
docker volume create kapacitor-data
```

## Running

```sh
docker run -d \
  -h influxdb.kapacitor.local \
  -v kapacitor-influxdb-data:/var/lib/influxdb \
  -v kapacitor-influxdb-config:/etc/influxdb \
  -p 8086:8086 \
  --name kapacitor-influxdb \
  influxdb:1.7-alpine
```

```sh
docker run -d \
  -h kapacitor.local \
  -e KAPACITOR_INFLUXDB_0_URLS_0=http://kapacitor-influxdb:8086 \
  -v kapacitor-data:/var/lib/kapacitor \
  -p 9092:9092 \
  --name kapacitor \
  kapacitor:1.5-alpine
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:9092'
```

## Remove

```sh
docker rm -f kapacitor-influxdb kapacitor
docker volume rm kapacitor-influxdb-data kapacitor-influxdb-config kapacitor-data
```
