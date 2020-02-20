# Confluent Schema Registry

<!--
https://github.com/weisurya/kafka-playground-python/blob/master/docker-compose.yml
-->

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

### Remove

```sh
docker rm -f zookeeper kafka schema-registry schema-registry-ui
docker volume rm zookeeper-data zookeeper-log kafka-data
```

## Requests

```sh
# Register a new version of a schema under the subject "Kafka-value"
curl \
  -X POST \
  -H 'Content-Type: application/vnd.schemaregistry.v1+json' \
  -d '{"schema": "{\"type\": \"string\"}"}' \
  http://127.0.0.1:8081/subjects/Kafka-value/versions

# List all subjects
curl \
  -X GET \
  http://127.0.0.1:8081/subjects

# List all schema versions registered under the subject "Kafka-value"
curl \
  -X GET \
  http://127.0.0.1:8081/subjects/Kafka-value/versions

# Fetch a schema by globally unique id 1
curl \
  -X GET \
  http://127.0.0.1:8081/schemas/ids/1

# Fetch version 1 of the schema registered under subject "Kafka-value"
curl \
  -X GET \
  http://127.0.0.1:8081/subjects/Kafka-value/versions/1

# Fetch the most recently registered schema under subject "Kafka-value"
curl \
  -X GET \
  http://127.0.0.1:8081/subjects/Kafka-value/versions/latest

# Delete version 3 of the schema registered under subject "Kafka-value"
curl \
  -X DELETE \
  http://127.0.0.1:8081/subjects/Kafka-value/versions/1

# Delete all versions of the schema registered under subject "Kafka-value"
curl \
  -X DELETE \
  http://127.0.0.1:8081/subjects/Kafka-value
```

```sh
# Register a new version of a schema under the subject "Kafka-key"
curl \
  -X POST \
  -H 'Content-Type: application/vnd.schemaregistry.v1+json' \
  -d '{"schema": "{\"type\": \"string\"}"}' \
  http://127.0.0.1:8081/subjects/Kafka-key/versions

# Check whether a schema has been registered under subject "Kafka-key"
curl \
  -X POST \
  -H 'Content-Type: application/vnd.schemaregistry.v1+json' \
  -d '{"schema": "{\"type\": \"string\"}"}' \
  http://127.0.0.1:8081/subjects/Kafka-key

# Test compatibility of a schema with the latest schema under subject "Kafka-key"
curl \
  -X POST \
  -H 'Content-Type: application/vnd.schemaregistry.v1+json' \
  -d '{"schema": "{\"type\": \"string\"}"}' \
  http://127.0.0.1:8081/compatibility/subjects/Kafka-key/versions/latest
```

```sh
# Get top level config
curl \
  -X GET \
  http://127.0.0.1:8081/config

# Update compatibility requirements globally
curl \
  -X PUT \
  -H 'Content-Type: application/vnd.schemaregistry.v1+json' \
  -d '{"compatibility": "NONE"}' \
  http://127.0.0.1:8081/config

# Update compatibility requirements under the subject "Kafka-key"
curl \
  -X PUT \
  -H 'Content-Type: application/vnd.schemaregistry.v1+json' \
  -d '{"compatibility": "BACKWARD"}' \
  http://127.0.0.1:8081/config/Kafka-key
```

<!--
https://github.com/DVentas/log-processor/tree/master/schema
-->

```sh
cat << EOF > /tmp/InputLog.avsc
{
    "schema": "{
        \"namespace\": \"com.example.logParser.avro\",
        \"name\": \"InputLog\",
        \"type\": \"record\",
        \"fields\": [{
                \"name\": \"time\",
                \"type\": \"long\"
            },
            {
                \"name\": \"source\",
                \"type\": \"string\"
            },
            {
                \"name\": \"dest\",
                \"type\": \"string\"
            }
        ]
    }"
}
EOF

curl \
  -H 'Content-Type: application/vnd.schemaregistry.v1+json' \
  -d @/tmp/InputLog.avsc \
  http://127.0.0.1:8081/subjects/input-log-avro/versions
```
