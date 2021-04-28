# Confluent KSQL Server

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h zookeeper \
  -v zookeeper-data:/data \
  -v zookeeper-log:/datalog \
  -p 2182:2181 \
  --name zookeeper \
  docker.io/library/zookeeper:3.5.6
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h kafka \
  -e KAFKA_PORT='9092' \
  -e KAFKA_LISTENERS='PLAINTEXT://kafka:9092' \
  -e KAFKA_ZOOKEEPER_CONNECT='zookeeper:2181' \
  -e KAFKA_CREATE_TOPICS='example:4:1' \
  -v kafka-data:/var/lib/kafka/data \
  -p 9092:9092 \
  --name kafka \
  docker.io/wurstmeister/kafka:2.12-2.3.0
```

```sh
# Test
watch kafkacat -Lb 127.0.0.1:9092
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h schema-registry \
  -e SCHEMA_REGISTRY_HOST_NAME='schema-registry' \
  -e SCHEMA_REGISTRY_KAFKASTORE_CONNECTION_URL='zookeeper:2181' \
  -p 8081:8081 \
  --name schema-registry \
  docker.io/confluentinc/cp-schema-registry:5.3.2
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h schema-registry-ui \
  -e SCHEMAREGISTRY_URL='http://schema-registry:8081' \
  -e PROXY='true' \
  -p 8000:8000 \
  --name schema-registry-ui \
  docker.io/landoop/schema-registry-ui:0.9.5
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8000'
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h ksql-server \
  -e KSQL_CONFIG_DIR='/etc/ksql' \
  -e KSQL_BOOTSTRAP_SERVERS='kafka:9092' \
  -e KSQL_LISTENERS='http://ksql-server:8088' \
  -e KSQL_KSQL_SERVICE_ID='ksql-examples-service-id' \
  -e KSQL_SCHEMA_REGISTRY_URL='http://schema-registry:8081' \
  -e KSQL_LOG4J_OPTS='-Dlog4j.configuration=file:/etc/ksql/log4j-rolling.properties' \
  -p 8088:8088 \
  --name ksql-server \
  docker.io/confluentinc/cp-ksql-server:5.3.2
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8088'
```

### Remove

```sh
docker rm -f zookeeper kafka schema-registry schema-registry-ui
docker volume rm zookeeper-data zookeeper-log kafka-data
```
