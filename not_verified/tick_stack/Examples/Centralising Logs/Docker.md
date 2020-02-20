# Docker

## Volume

```sh
docker volume create example-influxdb-data
docker volume create example-influxdb-config
docker volume create example-kapacitor-data
docker volume create example-chronograf-data
docker volume create example-telegraf-config
docker volume create example-nginx-conf
```

## Running

```sh
docker run -d \
  -h influxdb \
  -v example-influxdb-data:/var/lib/influxdb \
  -v example-influxdb-config:/etc/influxdb \
  -p 8086:8086 \
  --name example-influxdb \
  docker.io/library/influxdb:1.7-alpine
```

```sh
docker run -d \
  -h kapacitor \
  -e KAPACITOR_INFLUXDB_0_URLS_0=http://example-influxdb:8086 \
  -v example-kapacitor-data:/var/lib/kapacitor \
  -p 9092:9092 \
  --name example-kapacitor \
  docker.io/library/kapacitor:1.5-alpine
```

```sh
docker run -d \
  -h chronograf \
  -v example-chronograf-data:/var/lib/chronograf \
  -p 8888:8888 \
  --name example-chronograf \
  docker.io/library/chronograf:1.7-alpine --influxdb-url=http://example-influxdb:8086 --kapacitor-url=http://example-kapacitor:9092
```

```sh
docker run -d \
  -h telegraf \
  -v example-telegraf-config:/etc/telegraf \
  -p 6514:6514/udp \
  --name example-telegraf \
  docker.io/library/telegraf:1.10-alpine
```

```sh
docker exec -i example-telegraf /bin/sh << EOSHELL
cat << EOF > /etc/telegraf/telegraf.conf
[agent]
  interval = "1s"
  debug = true

[[inputs.syslog]]
  server = "udp://:6514"

[[inputs.nginx]]
  urls = ["http://example-nginx/server_status"]

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
  -h nginx \
  -v example-nginx-conf:/etc/nginx/conf.d \
  -p 8080:80 \
  --name example-nginx \
  --log-driver syslog \
  --log-opt syslog-address='udp://localhost:6514' \
  --log-opt syslog-format='rfc5424micro' \
  docker.io/library/nginx:1.15.8-alpine
```

```sh
docker exec -i example-nginx /bin/sh << EOSHELL
cat << EOF > /etc/nginx/conf.d/default.conf
server {
    listen 80;
    server_name localhost;

    location / {
        root /usr/share/nginx/html;
        index index.html index.htm;
    }

    location /server_status {
        stub_status;
    }

    error_page 500 502 503 504 /50x.html;
    location = /50x.html {
        root /usr/share/nginx/html;
    }
}

EOF
EOSHELL
```

```sh
docker restart example-nginx
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8888/logs'
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080/server_status'
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

## Remove

```sh
docker rm -f example-influxdb example-kapacitor example-chronograf example-telegraf example-nginx
docker volume rm example-influxdb-data example-influxdb-config example-kapacitor-data example-chronograf-data example-telegraf-config example-nginx-conf
```
