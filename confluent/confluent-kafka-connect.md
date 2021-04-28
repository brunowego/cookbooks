# Confluent Kafka Connect

<!--
https://github.com/krzwalko/DataStreamingWorkshop
https://github.com/arossmann/metrics_exporter/blob/b86bf544e8c282a41e40e8e870d41a8dea22ade1/docker-compose.yaml
https://github.com/search?o=desc&q=%22confluentinc%2Fcp-kafka-connect%22&s=indexed&type=Code
-->

## References

- [Docs](https://docs.confluent.io/current/connect/index.html)

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Dependencies

- [Apache Kafka](/apache_kafka.md#docker)

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h kafka-connect \
  --domainname kafka-connect \
  -e CONNECT_BOOTSTRAP_SERVERS='kafka:9092' \
  -e CONNECT_REST_ADVERTISED_HOST_NAME='kafka-connect' \
  -e CONNECT_REST_PORT='8083' \
  -e CONNECT_GROUP_ID='compose-connect-group' \
  -e CONNECT_CONFIG_STORAGE_TOPIC='docker-connect-configs' \
  -e CONNECT_OFFSET_STORAGE_TOPIC='docker-connect-offsets' \
  -e CONNECT_STATUS_STORAGE_TOPIC='docker-connect-status' \
  -e CONNECT_KEY_CONVERTER='org.apache.kafka.connect.storage.StringConverter' \
  -e CONNECT_VALUE_CONVERTER='org.apache.kafka.connect.storage.StringConverter' \
  -e CONNECT_INTERNAL_KEY_CONVERTER='org.apache.kafka.connect.json.JsonConverter' \
  -e CONNECT_INTERNAL_VALUE_CONVERTER='org.apache.kafka.connect.json.JsonConverter' \
  -e CONNECT_CONFIG_STORAGE_REPLICATION_FACTOR='1' \
  -e CONNECT_OFFSET_STORAGE_REPLICATION_FACTOR='1' \
  -e CONNECT_STATUS_STORAGE_REPLICATION_FACTOR='1' \
  -e CONNECT_PLUGIN_PATH='/usr/share/java,/etc/kafka-connect/jars' \
  -e CONNECT_CONFLUENT_TOPIC_REPLICATION_FACTOR='1' \
  -v confluent-kafka-connect-plugins:/etc/kafka-connect/jars \
  -v confluent-kafka-connect-connect-secrets:/etc/kafka-connect/secrets \
  -v confluent-kafka-connect-kafka-secrets:/etc/kafka/secrets \
  -v confluent-kafka-connect-data:/var/lib/kafka/data \
  -p 8083:8083 \
  --name confluent-kafka-connect \
  --network workbench \
  docker.io/confluentinc/cp-kafka-connect:5.1.4
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8083'
```

### Remove

```sh
docker rm -f confluent-kafka-connect

docker volume rm \
  confluent-kafka-connect-plugins \
  confluent-kafka-connect-connect-secrets \
  confluent-kafka-connect-kafka-secrets \
  confluent-kafka-connect-data
```
