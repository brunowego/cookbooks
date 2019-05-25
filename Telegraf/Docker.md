# Docker

## Volume

```sh
docker volume create telegraf-influxdb-data
docker volume create telegraf-influxdb-config
docker volume create telegraf-config
```

## Running

```sh
docker run -d \
  -h influxdb.telegraf.local \
  -v telegraf-influxdb-data:/var/lib/influxdb \
  -v telegraf-influxdb-config:/etc/influxdb \
  -p 8086:8086 \
  --name telegraf-influxdb \
  --restart always \
  influxdb:1.7-alpine
```

```sh
docker run -d \
  -h app.telegraf.local \
  -v telegraf-config:/etc/telegraf \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  -p 6514:6514/udp \
  --name telegraf-app \
  --restart always \
  --link telegraf-influxdb \
  telegraf:1.10-alpine
```

```sh
docker exec -i telegraf-app /bin/sh << EOSHELL
cat << EOF > /etc/telegraf/telegraf.conf
[[outputs.influxdb]]
  urls = ["http://telegraf-influxdb:8086"]

[[inputs.cpu]]
  percpu = true
  totalcpu = true
  collect_cpu_time = false
  report_active = false

[[inputs.disk]]
  ignore_fs = ["tmpfs", "devtmpfs", "devfs", "overlay", "aufs", "squashfs"]

EOF
EOSHELL
```

```sh
docker restart telegraf-app
```

## Remove

```sh
docker rm -f telegraf-influxdb telegraf-app
docker volume rm telegraf-influxdb-data telegraf-influxdb-config telegraf-config
```
