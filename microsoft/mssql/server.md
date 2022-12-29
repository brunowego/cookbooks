# Microsoft SQL Server

## Links

- [Docker Hub](https://hub.docker.com/_/microsoft-mssql-server)

## Docs

- [Quickstart: Run SQL Server container images with Docker](https://docs.microsoft.com/en-us/sql/linux/quickstart-install-connect-docker?view=sql-server-ver15&pivots=cs1-bash)

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
  mcr.microsoft.com/mssql/server:2019-latest
```

| Login | Password |
| --- | --- |
| `sa` | `Pa$$w0rd!` |

### Remove

```sh
docker rm -f mssql-server

docker volume rm mssql-server-data
```
