# Docker

## Volume

```sh
docker volume create tags-influxdb-data
docker volume create tags-influxdb-config
docker volume create tags-kapacitor-data
docker volume create tags-chronograf-data
docker volume create tags-telegraf-config
```

## Running

```sh
docker run -d \
  -h influxdb.tags.local \
  -v tags-influxdb-data:/var/lib/influxdb \
  -v tags-influxdb-config:/etc/influxdb \
  -p 8086:8086 \
  --name tags-influxdb \
  --restart always \
  influxdb:1.7-alpine
```

```sh
docker run -d \
  -h kapacitor.tags.local \
  -e KAPACITOR_INFLUXDB_0_URLS_0=http://tags-influxdb:8086 \
  -v tags-kapacitor-data:/var/lib/kapacitor \
  -p 9092:9092 \
  --name tags-kapacitor \
  --restart always \
  --link tags-influxdb \
  kapacitor:1.5-alpine
```

```sh
docker run -d \
  -h chronograf.tags.local \
  -v tags-chronograf-data:/var/lib/chronograf \
  -p 8888:8888 \
  --name tags-chronograf \
  --restart always \
  --link tags-influxdb \
  --link tags-kapacitor \
  chronograf:1.7-alpine --influxdb-url=http://tags-influxdb:8086 --kapacitor-url=http://tags-kapacitor:9092
```

```sh
docker run -d \
  -h telegraf.tags.local \
  -v tags-telegraf-config:/etc/telegraf \
  -p 6514:6514/udp \
  --name tags-telegraf \
  --restart always \
  --link tags-influxdb \
  telegraf:1.10-alpine
```

```sh
docker exec -i tags-telegraf /bin/sh << EOSHELL
cat << EOF > /etc/telegraf/telegraf.conf
[agent]
  interval = "1s"
  debug = true

[[inputs.system]]
[[inputs.cpu]]
[[inputs.mem]]

[[outputs.influxdb]]
  urls = ["http://tags-influxdb:8086"]

EOF
EOSHELL
```

```sh
docker restart tags-telegraf
```

```sh
docker exec -i tags-kapacitor /bin/sh << EOSHELL
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
docker exec -i tags-kapacitor /bin/sh << EOSHELL
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
docker exec -i tags-kapacitor /bin/sh << EOSHELL
kapacitor define notag-stream -tick /tmp/live-stream.tick
kapacitor enable notag-stream
kapacitor define notag-batch -tick /tmp/historical-batch.tick
kapacitor replay-live batch -task notag-batch -past 90d -rec-time
EOSHELL
```

```sh
echo -e "[INFO]\thttp://$(docker-machine ip):8888"
```

## Remove

```sh
docker rm -f tags-influxdb tags-kapacitor tags-chronograf tags-telegraf
docker volume rm tags-influxdb-data tags-influxdb-config tags-kapacitor-data tags-chronograf-data tags-telegraf-config
```
