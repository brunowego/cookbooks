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

## Docker Compose

### Configuration

**Refer:** `./config/debezium/application.properties`

```properties
# debezium.sink.type=kafka
# debezium.sink.kafka.producer.bootstrap.servers=redpanda:9092
# debezium.sink.kafka.producer.key.serializer=org.apache.kafka.common.serialization.StringSerializer
# debezium.sink.kafka.producer.value.serializer=org.apache.kafka.common.serialization.StringSerializer

# debezium.source.connector.class=io.debezium.connector.postgresql.PostgresConnector
# debezium.source.offset.storage.file.filename=data/offsets.dat
# debezium.source.offset.flush.interval.ms=0
# debezium.source.database.hostname=postgres
# debezium.source.database.port=5432
# debezium.source.database.user=auth
# debezium.source.database.password=auth
# debezium.source.database.dbname=auth
# debezium.source.database.server.name=postgres
# debezium.source.schema.whitelist=public
# debezium.source.plugin.name=pgoutput
# debezium.source.topic.prefix=auth

debezium.transforms=unwrap
debezium.transforms.unwrap.type=io.debezium.transforms.ExtractNewRecordState

debezium.format.key.schemas.enable=false
debezium.format.value.schemas.enable=false
```

### Manifest

```yml
---
version: '3'

services:
  # ...

  debezium:
    image: docker.io/debezium/server:2.3
    container_name: boilerplate-debezium
    volumes:
      - type: volume
        source: debezium-data
        target: /debezium/data
      - type: bind
        source: ./config/debezium
        target: /debezium/conf
    ports:
      - target: 8080
        published: 8080
        protocol: tcp
    restart: unless-stopped
    # depends_on:
    #   postgres: { condition: service_healthy }
    #   redpanda: { condition: service_healthy }

volumes:
  debezium-data:
    driver: local
```
