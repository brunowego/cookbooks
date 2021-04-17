# Docker

## Volume

```sh
docker volume create example-influxdb-data
docker volume create example-influxdb-config
docker volume create example-telegraf-config
docker volume create example-chronograf-data
```

## Build

```sh
cat << EOF | docker build $(echo $DOCKER_BUILD_OPTS) -t example/influxdata-inch -
FROM docker.io/golang:1.11

RUN go get github.com/influxdata/inch/cmd/inch

ENTRYPOINT ["inch"]

EOF
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
  metric_batch_size = 100000
  metric_buffer_limit = 4000000

[[inputs.influxdb_listener]]
  service_address = ":8086"

[[inputs.internal]]
  collect_memstats = true

[[outputs.influxdb]]
  urls = ["http://example-influxdb:8086"]

EOF
EOSHELL
```

```sh
docker restart example-telegraf
```

```sh
docker run -d \
  -h influxdata-inch \
  --name example-influxdata-inch \
  example/influxdata-inch:latest -b 10000 -c 50000 -db telegraf -host http://example-telegraf:8086 -m 1 -p 5000000
```

```sh
docker run -d \
  -h chronograf \
  -v example-chronograf-data:/var/lib/chronograf \
  -p 8888:8888 \
  --name example-chronograf \
  chronograf:1.7-alpine --influxdb-url=http://example-influxdb:8086
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8888'
```

## Remove

```sh
docker rm -f example-influxdb example-telegraf example-influxdata-inch example-chronograf
docker volume rm example-influxdb-data example-influxdb-config example-telegraf-config example-chronograf-data
```
