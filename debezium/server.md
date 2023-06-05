# Debezium Server

## Links

- [Docs](https://debezium.io/documentation/reference/stable/operations/debezium-server.html)

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
  -h debezium-server \
  -v debezium-config:/debezium/conf \
  -v debezium-data:/debezium/data \
  -p 8080:8080 \
  --name debezium-server \
  --network workbench \
  docker.io/debezium/server:2.3
```

### Issues

#### Missing Topic Prefix Property

```log
Connector configuration is not valid. The 'topic.prefix' value is invalid: A value is required
```

**Refer:** `/debezium/conf/application.properties`

```properties
# ...
debezium.source.topic.prefix=auth
```

#### Missing Wal Level Property

```log
Postgres server wal_level property must be 'logical' but is: 'replica'
```

Add `-c wal_level=logical` to `postgres` command.

### Remove

```sh
docker rm -f debezium-server

docker volume rm debezium-config debezium-data
```
