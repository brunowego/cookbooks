# Confluent Control Center

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Dependencies

- [Apache Kafka](/apache_kafka.md#docker)
- [Confluent Kafka Connect](/confluent-kafka-connect.md#docker)
- [Confluent Schema Registry](/confluent-schema-registry.md#docker)
- [Confluent KSQL Server](/confluent-ksql-server.md#docker)

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h control-center \
  -v grafana-config:/etc/grafana \
  -v grafana-data:/var/lib/grafana \
  -e CONTROL_CENTER_BOOTSTRAP_SERVERS='kafka:29092' \
  -e CONTROL_CENTER_ZOOKEEPER_CONNECT='kafka-zookeeper:2181' \
  -e CONTROL_CENTER_CONNECT_CLUSTER='connect:8083' \
  -e CONTROL_CENTER_KSQL_URL='http://ksql-server:8088' \
  -e CONTROL_CENTER_KSQL_ADVERTISED_URL='http://localhost:8088' \
  -e CONTROL_CENTER_SCHEMA_REGISTRY_URL='http://schema-registry:8081' \
  -e CONTROL_CENTER_REPLICATION_FACTOR='1' \
  -e CONTROL_CENTER_INTERNAL_TOPICS_PARTITIONS='1' \
  -e CONTROL_CENTER_MONITORING_INTERCEPTOR_TOPIC_PARTITIONS='1' \
  -e CONFLUENT_METRICS_TOPIC_REPLICATION='1' \
  -e PORT='9021' \
  -p 9021:9021 \
  --name confluent-control-center \
  --network workbench \
  docker.io/confluentinc/cp-enterprise-control-center:5.1.4
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:9021'
```

### Remove

```sh
docker rm -f confluent-control-center

docker volume rm grafana-config grafana-data
```
