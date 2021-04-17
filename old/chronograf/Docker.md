# Docker

## Volume

```sh
docker volume create chronograf-influxdb-data
docker volume create chronograf-influxdb-config
docker volume create chronograf-kapacitor-data
docker volume create chronograf-data
```

## Running

```sh
docker run -d \
  -h influxdb.chronograf.local \
  -v chronograf-influxdb-data:/var/lib/influxdb \
  -v chronograf-influxdb-config:/etc/influxdb \
  -p 8086:8086 \
  --name chronograf-influxdb \
  influxdb:1.7-alpine
```

```sh
docker run -d \
  -h kapacitor.chronograf.local \
  -e KAPACITOR_INFLUXDB_0_URLS_0=http://chronograf-influxdb:8086 \
  -v chronograf-kapacitor-data:/var/lib/kapacitor \
  -p 9092:9092 \
  --name chronograf-kapacitor \
  kapacitor:1.5-alpine
```

```sh
docker run -d \
  -h chronograf.local \
  -v chronograf-data:/var/lib/chronograf \
  -p 8888:8888 \
  --name chronogra \
  chronograf:1.7-alpine --influxdb-url=http://chronograf-influxdb:8086 --kapacitor-url=http://chronograf-kapacitor:9092
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8888'
```

## Remove

```sh
docker rm -f chronograf-influxdb chronograf
docker volume rm chronograf-influxdb-data chronograf-influxdb-config chronograf-data
```
