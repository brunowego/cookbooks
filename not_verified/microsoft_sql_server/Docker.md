# Docker

## Volume

```sh
docker volume create mssql-server-data
```

## Running

```sh
docker run -d \
  -h mssql-server \
  -e ACCEPT_EULA=Y \
  -e SA_PASSWORD=PaSSw0rd! \
  -v mssql-server-data:/var/opt/mssql/data \
  -p 1433:1433 \
  --name mssql-server \
  mcr.microsoft.com/mssql/server:2017-latest-ubuntu
```

```sh
docker exec -i mssql-server /opt/mssql-tools/bin/sqlcmd -S 127.0.0.1 -U sa -P 'PaSSw0rd!' -Q 'CREATE DATABASE example'
```

## Remote

```sh
docker rm -f mssql-server
docker volume rm mssql-server-data
```
