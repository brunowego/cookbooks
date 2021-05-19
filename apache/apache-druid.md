# Apache Druid

## References

- [Apache Avro Extension](https://druid.apache.org/docs/latest/development/extensions-core/avro.html)
- [Apache Parquet Extension](https://druid.apache.org/docs/latest/development/extensions-core/parquet.html)
- [Load streaming data from Apache Kafka](https://druid.apache.org/docs/latest/tutorials/tutorial-kafka.html)

## CLI

### Installation

#### Homebrew

```sh
brew install druid
```

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
  -h postgres \
  -e POSTGRES_USER='druid' \
  -e POSTGRES_PASSWORD='druid' \
  -e POSTGRES_DB='druid' \
  -v druid-postgres-data:/var/lib/postgresql/data \
  --name druid-postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h zookeeper \
  -e ZOO_MY_ID='1' \
  -v druid-zookeeper-data:/data \
  -v druid-zookeeper-datalog:/datalog \
  -v druid-zookeeper-logs:/logs \
  --name druid-zookeeper \
  --network workbench \
  docker.io/library/zookeeper:3.5.6
```

```sh
export DRUID_ENV_FILE=$(base64 <(cat << \EOF
DRUID_XMX=1g
DRUID_XMS=1g
DRUID_MAXNEWSIZE=250m
DRUID_NEWSIZE=250m
DRUID_MAXDIRECTMEMORYSIZE=6172m

druid_emitter_logging_logLevel=debug

druid_extensions_loadList=["druid-histogram", "druid-datasketches", "druid-lookups-cached-global", "postgresql-metadata-storage", "druid-kafka-indexing-service", "druid-avro-extensions"]

druid_zk_service_host=druid-zookeeper

druid_metadata_storage_host=
druid_metadata_storage_type=postgresql
druid_metadata_storage_connector_connectURI=jdbc:postgresql://druid-postgres:5432/druid
druid_metadata_storage_connector_user=druid
druid_metadata_storage_connector_password=druid

druid_coordinator_balancer_strategy=cachingCost

druid_indexer_runner_javaOptsArray=["-server", "-Xmx1g", "-Xms1g", "-XX:MaxDirectMemorySize=3g", "-Duser.timezone=UTC", "-Dfile.encoding=UTF-8", "-Djava.util.logging.manager=org.apache.logging.log4j.jul.LogManager"]
druid_indexer_fork_property_druid_processing_buffer_sizeBytes=268435456

druid_storage_type=local
druid_storage_storageDirectory=/opt/data/segments

druid_indexer_logs_type=file
druid_indexer_logs_directory=/opt/data/indexing-logs

druid_processing_numThreads=2
druid_processing_numMergeBuffers=2

DRUID_LOG4J=<?xml version="1.0" encoding="UTF-8" ?><Configuration status="WARN"><Appenders><Console name="Console" target="SYSTEM_OUT"><PatternLayout pattern="%d{ISO8601} %p [%t] %c - %m%n"/></Console></Appenders><Loggers><Root level="info"><AppenderRef ref="Console"/></Root><Logger name="org.apache.druid.jetty.RequestLog" additivity="false" level="DEBUG"><AppenderRef ref="Console"/></Logger></Loggers></Configuration>
EOF
))
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h coordinator \
  --env-file <(echo $DRUID_ENV_FILE | base64 --decode) \
  -v druid-data:/opt/data \
  -v druid-coordinator-var:/opt/druid/var \
  -p 8081:8081 \
  --name druid-coordinator \
  --network workbench \
  docker.io/apache/druid:0.17.0 coordinator
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h broker \
  --env-file <(echo $DRUID_ENV_FILE | base64 --decode) \
  -v druid-broker-var:/opt/druid/var \
  -p 8082:8082 \
  --name druid-broker \
  --network workbench \
  docker.io/apache/druid:0.17.0 broker
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h historical \
  --env-file <(echo $DRUID_ENV_FILE | base64 --decode) \
  -v druid-data:/opt/data \
  -v druid-historical-var:/opt/druid/var \
  -p 8083:8083 \
  --name druid-historical \
  --network workbench \
  docker.io/apache/druid:0.17.0 historical
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h middlemanager \
  --env-file <(echo $DRUID_ENV_FILE | base64 --decode) \
  -v druid-data:/opt/data \
  -v druid-middlemanager-var:/opt/druid/var \
  -p 8091:8091 \
  --name druid-middlemanager \
  --network workbench \
  docker.io/apache/druid:0.17.0 middleManager
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h router \
  --env-file <(echo $DRUID_ENV_FILE | base64 --decode) \
  -v druid-router-var:/opt/druid/var \
  -p 8888:8888 \
  --name druid-router \
  --network workbench \
  docker.io/apache/druid:0.17.0 router
```

> Wait! This process take a while.

```sh
docker logs -f druid-router | sed '/Started ServerConnector/ q'
```

```sh
# Open
echo -e '[INFO]\thttp://127.0.0.1:8888'
```

### State

```sh
#
docker stop \
  druid-postgres \
  druid-zookeeper \
  druid-coordinator \
  druid-broker \
  druid-historical \
  druid-middlemanager \
  druid-router

#
docker start \
  druid-postgres \
  druid-zookeeper \
  druid-coordinator \
  druid-broker \
  druid-historical \
  druid-middlemanager \
  druid-router
```

### Remove

```sh
docker rm -f \
  druid-postgres \
  druid-zookeeper \
  druid-coordinator \
  druid-broker \
  druid-historical \
  druid-middlemanager \
  druid-router

docker volume rm \
  druid-postgres-data \
  druid-zookeeper-data \
  druid-zookeeper-datalog \
  druid-zookeeper-logs \
  druid-data \
  druid-coordinator-var \
  druid-broker-var \
  druid-historical-var \
  druid-middlemanager-var \
  druid-router-var
```

## Docs

### Kafka

- [Apache Kafka](/apache_kafka.md#docker)

```sh
#
docker exec -i druid-router /bin/sh << EOSHELL
gunzip \
  -c ./quickstart/tutorial/wikiticker-2015-09-12-sampled.json.gz \
  > ./quickstart/tutorial/wikiticker-2015-09-12-sampled.json
EOSHELL

docker exec -i druid-router ls \
  -lh ./quickstart/tutorial/wikiticker-2015-09-12-sampled.json

docker exec -i druid-router wc \
  -l ./quickstart/tutorial/wikiticker-2015-09-12-sampled.json

#
# docker exec -i \
#   -e KAFKA_OPTS='-Dfile.encoding=UTF-8' \
#   kafka /bin/sh << EOSHELL
# kafka-console-producer.sh \
#   --broker-list 'kafka:9092' \
#   --topic 'wikipedia' \
#   < $(docker exec -i druid-router cat ./quickstart/tutorial/wikiticker-2015-09-12-sampled.json)
# EOSHELL

kafkacat \
  -Cb 127.0.0.1:9092 \
  -t wikipedia

docker exec druid-router cat ./quickstart/tutorial/wikiticker-2015-09-12-sampled.json | kafkacat \
  -Pb '127.0.0.1:9092' \
  -t 'wikipedia' \
  -z snappy

#
# docker exec kafka kafka-console-consumer.sh \
#   --bootstrap-server 'kafka:9092' \
#   --from-beginning \
#   --topic 'wikipedia'
```

1. Load data -> Start a new spec
2. Apache Kafka -> Connect data
   - Bootstrap servers: `kafka:9092`
   - Topic: `wikipedia`
   - Apply
3. Next: Parse data
   - Input format: `json`
4. Next: Parse time
5. Next: Transform
6. Next: Filter
7. Next: Configure schema
8. Next: Partition
9. Next: Tune
   - Input tuning: Use earliest offset: Check True
10. Next: Publish
11. Next: Edit spec
12. Submit
