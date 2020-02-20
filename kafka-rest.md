# Confluent Kafka Rest

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
  -h kafka-rest \
  -e KAFKA_REST_HOST_NAME='kafka-rest' \
  -e KAFKA_REST_LISTENERS='http://kafka-rest:8082' \
  -e KAFKA_REST_ZOOKEEPER_CONNECT='zookeeper:2181' \
  -p 8082:8082 \
  --name kafka-rest \
  docker.io/confluentinc/cp-kafka-rest:5.3.2
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h kafka-topics-ui \
  -e PROXY='true' \
  -e KAFKA_REST_PROXY_URL='http://kafka-rest:8082' \
  -p 8000:8000 \
  --name kafka-topics-ui \
  docker.io/landoop/kafka-topics-ui:0.9.4
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8000'
```

### Remove

```sh
docker rm -f zookeeper kafka kafka-rest kafka-topics-ui
docker volume rm zookeeper-data zookeeper-log kafka-data
```

## Requests

```sh
# Get a list of topics
curl \
  -X GET \
  'http://127.0.0.1:8082/topics'

# Get info about one topic
curl \
  -X GET \
  'http://127.0.0.1:8082/topics/example'

# Produce a message with JSON data
curl \
  -X POST \
  -H 'Content-Type: application/vnd.kafka.json.v2+json' \
  -d '{"records":[{"value":{"name": "John"}}]}' \
  'http://127.0.0.1:8082/topics/example'

# Create a consumer for JSON data, starting at the beginning of the topic's log. The consumer group is called "my_json_consumer" and the instance is "my_consumer_instance".
curl \
  -X POST \
  -H 'Content-Type: application/vnd.kafka.v2+json' \
  -H 'Accept: application/vnd.kafka.v2+json' \
  -d '{"name":"my_consumer_instance","format":"json","auto.offset.reset":"earliest"}' \
  'http://127.0.0.1:8082/consumers/my_json_consumer'

# Subscribe the consumer to a topic
curl \
  -X POST \
  -H 'Content-Type: application/vnd.kafka.v2+json' \
  -d '{"topics":["example"]}' \
  'http://127.0.0.1:8082/consumers/my_json_consumer/instances/my_consumer_instance/subscription'

# Then consume some data from a topic using the base URL in the first response.
curl \
  -X GET \
  -H 'Accept: application/vnd.kafka.json.v2+json' \
  'http://127.0.0.1:8082/consumers/my_json_consumer/instances/my_consumer_instance/records'

# Finally, close the consumer with a DELETE to make it leave the group and clean up its resources.
curl \
  -X DELETE \
  -H 'Accept: application/vnd.kafka.v2+json' \
  'http://127.0.0.1:8082/consumers/my_json_consumer/instances/my_consumer_instance'
```
