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

EOF
EOSHELL
```

```sh
docker restart example-telegraf
```

```sh
docker exec -i example-kapacitor /bin/sh << EOSHELL
cat << EOF > /tmp/historical-batch.tick
dbrp "telegraf"."autogen"

batch
    |query('SELECT usage_user FROM "telegraf"."autogen"."cpu"')
        .period(1m)
        .every(1m)
    |delete()
        .tag('host')
    |influxDBOut()
        .database('telegraf')
        .retentionPolicy('autogen')
        .measurement('notagbatch')
        .precision('s')

EOF
EOSHELL
```

```sh
docker exec -i example-kapacitor /bin/sh << EOSHELL
cat << EOF > /tmp/live-stream.tick
dbrp "telegraf"."autogen"

stream
    |from()
        .database('telegraf')
        .retentionPolicy('autogen')
        .measurement('cpu')
    |delete()
        .tag('host')
    |influxDBOut()
        .database('telegraf')
        .measurement('notag')

EOF
EOSHELL
```

```sh
docker exec -i example-kapacitor /bin/sh << EOSHELL
kapacitor define notag-stream -tick /tmp/live-stream.tick
kapacitor enable notag-stream
kapacitor define notag-batch -tick /tmp/historical-batch.tick
kapacitor replay-live batch -task notag-batch -past 90d -rec-time
EOSHELL
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8888'
```

## Remove

```sh
docker rm -f example-influxdb example-kapacitor example-chronograf example-telegraf
docker volume rm example-influxdb-data example-influxdb-config example-kapacitor-data example-chronograf-data example-telegraf-config
```
