# TimescaleDB

**Keywords:** Time Series Database, OLAP

## Links

- [Code Repository](https://github.com/timescale/timescaledb)
- [Main Website](https://timescale.com)
- Docs
  - [Continuous aggregates](https://docs.timescale.com/use-timescale/latest/continuous-aggregates/#continuous-aggregates)

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h timescaledb \
  -e POSTGRES_USER='dev' \
  -e POSTGRES_PASSWORD='dev' \
  -e POSTGRES_DB='dev' \
  -v timescaledb-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name timescaledb \
  --network workbench \
  docker.io/timescale/timescaledb-ha:pg17
```

<!--
docker.io/timescale/timescaledb:latest-pg17
-->

### Remove

```sh
docker rm -f timescaledb

docker volume rm timescaledb-data
```

## CLI

### Installation

```sh
# Using Homebrew
brew tap timescale/tap
brew install timescaledb
```

<!--
sed -i "s/^#shared_preload_libraries = ''/shared_preload_libraries = 'timescaledb'/" /usr/local/var/postgres/postgresql.conf

/usr/local/bin/timescaledb_move.sh

brew services restart postgresql

createuser postgres -s
-->
