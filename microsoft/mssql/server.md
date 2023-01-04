# Microsoft SQL Server

<!--
https://balta.io/blog/sql-server-docker
https://github.com/Microsoft/mssql-scripter
-->

## Links

- [Docker Hub](https://hub.docker.com/_/microsoft-mssql-server)

## Docs

- [Quickstart: Run SQL Server container images with Docker](https://docs.microsoft.com/sql/linux/quickstart-install-connect-docker?view=sql-server-ver15&pivots=cs1-bash)

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h mssql-server \
  -v mssql-server-data:/var/opt/mssql \
  -e SA_PASSWORD='Pa$$w0rd!' \
  -e ACCEPT_EULA='Y' \
  -p 1433:1433 \
  --name mssql-server \
  --network workbench \
  mcr.microsoft.com/mssql/server:2022-latest
```

| Login | Password    |
| ----- | ----------- |
| `sa`  | `Pa$$w0rd!` |

### Usage

```sh
#
docker exec -i mssql-server /opt/mssql-tools/bin/sqlcmd \
  -S 127.0.0.1 \
  -U sa \
  -P 'Pa$$w0rd!' \
  -Q 'CREATE DATABASE example'
```

### Remove

```sh
docker rm -f mssql-server

docker volume rm mssql-server-data
```
