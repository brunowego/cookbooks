# ClickHouse

## Docker

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
  --ulimit nofile=262144:262144 \
  docker.io/yandex/clickhouse-server:19.16
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
docker rm -f clickhouse
docker volume rm clickhouse-config clickhouse-data
```
