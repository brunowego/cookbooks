# Docker

## Volume

```sh
docker volume create logs-influxdb-data
docker volume create logs-influxdb-config
docker volume create logs-kapacitor-data
docker volume create logs-chronograf-data
docker volume create logs-telegraf-config
docker volume create logs-nginx-conf
```

## Running

```sh
docker run -d \
  -h influxdb.logs.local \
  -v logs-influxdb-data:/var/lib/influxdb \
  -v logs-influxdb-config:/etc/influxdb \
  -p 8086:8086 \
  --name logs-influxdb \
  --restart always \
  influxdb:1.7-alpine
```

```sh
docker run -d \
  -h kapacitor.logs.local \
  -e KAPACITOR_INFLUXDB_0_URLS_0=http://logs-influxdb:8086 \
  -v logs-kapacitor-data:/var/lib/kapacitor \
  -p 9092:9092 \
  --name logs-kapacitor \
  --restart always \
  --link logs-influxdb \
  kapacitor:1.5-alpine
```

```sh
docker run -d \
  -h chronograf.logs.local \
  -v logs-chronograf-data:/var/lib/chronograf \
  -p 8888:8888 \
  --name logs-chronograf \
  --restart always \
  --link logs-influxdb \
  --link logs-kapacitor \
  chronograf:1.7-alpine --influxdb-url=http://logs-influxdb:8086 --kapacitor-url=http://logs-kapacitor:9092
```

```sh
docker run -d \
  -h telegraf.logs.local \
  -v logs-telegraf-config:/etc/telegraf \
  -p 6514:6514/udp \
  --name logs-telegraf \
  --restart always \
  --link logs-influxdb \
  telegraf:1.10-alpine
```

```sh
docker exec -i logs-telegraf /bin/sh << EOSHELL
cat << EOF > /etc/telegraf/telegraf.conf
[agent]
  interval = "1s"
  debug = true

[[inputs.syslog]]
  server = "udp://:6514"

[[inputs.nginx]]
  urls = ["http://logs-nginx/server_status"]

[[outputs.influxdb]]
  urls = ["http://logs-influxdb:8086"]

EOF
EOSHELL
```

```sh
docker restart logs-telegraf
```

```sh
docker run -d \
  -h nginx.logs.local \
  -v logs-nginx-conf:/etc/nginx/conf.d \
  -p 8080:80 \
  --name logs-nginx \
  --restart always \
  --link logs-influxdb \
  --link logs-telegraf \
  --log-driver syslog \
  --log-opt syslog-address='udp://localhost:6514' \
  --log-opt syslog-format='rfc5424micro' \
  nginx:1.15.8-alpine
```

```sh
docker exec -i logs-nginx /bin/sh << 'EOSHELL'
cat << 'EOF' > /etc/nginx/conf.d/default.conf
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
docker restart logs-nginx
```

```sh
echo -e "[INFO]\thttp://$(docker-machine ip):8888/logs"
```

```sh
echo -e "[INFO]\thttp://$(docker-machine ip):8080/server_status"
```

```sh
echo -e "[INFO]\thttp://$(docker-machine ip):8080"
```

## Remove

```sh
docker rm -f logs-influxdb logs-kapacitor logs-chronograf logs-telegraf logs-nginx
docker volume rm logs-influxdb-data logs-influxdb-config logs-kapacitor-data logs-chronograf-data logs-telegraf-config logs-nginx-conf
```
