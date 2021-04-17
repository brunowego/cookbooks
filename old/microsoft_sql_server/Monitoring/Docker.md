# Docker

## Volume

```sh
docker volume create mssql-influxdb-data
docker volume create mssql-influxdb-config
docker volume create mssql-server-data
docker volume create mssql-telegraf-config
docker volume create mssql-chronograf-data
```

## Running

```sh
docker run -d \
  -h influxdb.mssql.local \
  -v mssql-influxdb-data:/var/lib/influxdb \
  -v mssql-influxdb-config:/etc/influxdb \
  -p 8086:8086 \
  --name mssql-influxdb \
  influxdb:1.7-alpine
```

```sh
docker run -d \
  -h server.mssql.local \
  -e ACCEPT_EULA=Y \
  -e SA_PASSWORD=PaSSw0rd! \
  -v mssql-server-data:/var/opt/mssql/data \
  -p 1433:1433 \
  --name mssql-server \
  mcr.microsoft.com/mssql/server:2017-latest-ubuntu
```

```sh
docker run -d \
  -h telegraf.mssql.local \
  -v mssql-telegraf-config:/etc/telegraf \
  -p 6514:6514/udp \
  --name mssql-telegraf \
  telegraf:1.10-alpine
```

```sh
docker exec -i mssql-telegraf /bin/sh << EOSHELL
cat << EOF > /etc/telegraf/telegraf.conf
[agent]
  debug = true

[[inputs.sqlserver]]
  servers = ["Server=mssql-server;Port=1433;User Id=sa;Password=PaSSw0rd!;app name=telegraf;log=1;"]

[[outputs.influxdb]]
  urls = ["http://mssql-influxdb:8086"]

EOF
EOSHELL
```

```sh
docker restart mssql-telegraf
```

```sh
docker run -d \
  -h chronograf.mssql.local \
  -v mssql-chronograf-data:/var/lib/chronograf \
  -p 8888:8888 \
  --name mssql-chronograf \
  chronograf:1.7-alpine --influxdb-url=http://mssql-influxdb:8086
```

## Remove

```sh
docker rm -f mssql-influxdb mssql-server mssql-telegraf mssql-chronograf
docker volume rm mssql-influxdb-data mssql-influxdb-config mssql-server-data mssql-telegraf-config mssql-chronograf-data
```
