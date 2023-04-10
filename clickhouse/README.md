# ClickHouse

<!--
https://github.com/datafuselabs/datafuse

https://artifacthub.io/packages/helm/open-8gears/clickhouse

https://github.com/search?q=path%3Apackage.json+%22clickhouse%22+%22nestjs%22&type=code

https://github.com/depyronick/nestjs-clickhouse
-->

## Links

- [Code Repository](https://github.com/ClickHouse/ClickHouse)
- [Main Website](https://clickhouse.com)

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
  -h clickhouse \
  -v clickhouse-config:/etc/clickhouse-server \
  -v clickhouse-data:/var/lib/clickhouse \
  -p 8123:8123 \
  -p 9000:9000 \
  -p 9009:9009 \
  --name clickhouse \
  --network workbench \
  --ulimit nofile=262144:262144 \
  docker.io/clickhouse/clickhouse-server:23.2.5
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8123'
```

```sh
docker exec -i clickhouse /usr/bin/clickhouse client -n <<-EOSQL
CREATE DATABASE `docker`;
CREATE TABLE docker.docker (x Int32) ENGINE = Log;
EOSQL
```

### Remove

```sh
docker rm -f \
  clickhouse

docker volume rm \
  clickhouse-config \
  clickhouse-data
```
