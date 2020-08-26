# Apache NiFi Registry

<!--
https://github.com/eSolutionsGrup/academy-nifi
-->

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
  -h zookeeper \
  -v zookeeper-secrets:/etc/zookeeper/secrets \
  -v zookeeper-data:/var/lib/zookeeper/data \
  -v zookeeper-log:/var/lib/zookeeper/log \
  -e ZOOKEEPER_CLIENT_PORT='2181' \
  -e ZOOKEEPER_TICK_TIME='2000' \
  -p 2181:2181 \
  --name zookeeper \
  --network workbench \
  docker.io/confluentinc/cp-zookeeper:5.5.1
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h kafka \
  -v kafka-secrets:/etc/kafka/secrets \
  -v kafka-data:/var/lib/kafka/data \
  -e KAFKA_BROKER_ID='1' \
  -e KAFKA_ZOOKEEPER_CONNECT='zookeeper:2181' \
  -e KAFKA_LISTENER_SECURITY_PROTOCOL_MAP='PLAINTEXT:PLAINTEXT,PLAINTEXT_HOST:PLAINTEXT' \
  -e KAFKA_ADVERTISED_LISTENERS='PLAINTEXT://kafka:29092,PLAINTEXT_HOST://localhost:9092' \
  -e KAFKA_METRIC_REPORTERS='io.confluent.metrics.reporter.ConfluentMetricsReporter' \
  -e KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR='1' \
  -e KAFKA_GROUP_INITIAL_REBALANCE_DELAY_MS='0' \
  -e KAFKA_CONFLUENT_LICENSE_TOPIC_REPLICATION_FACTOR='1' \
  -e KAFKA_TRANSACTION_STATE_LOG_MIN_ISR='1' \
  -e KAFKA_TRANSACTION_STATE_LOG_REPLICATION_FACTOR='1' \
  -e CONFLUENT_METRICS_REPORTER_BOOTSTRAP_SERVERS='kafka:29092' \
  -e CONFLUENT_METRICS_REPORTER_ZOOKEEPER_CONNECT='zookeeper:2181' \
  -e CONFLUENT_METRICS_REPORTER_TOPIC_REPLICAS='1' \
  -e CONFLUENT_METRICS_ENABLE='true' \
  -e CONFLUENT_SUPPORT_CUSTOMER_ID='anonymous' \
  -p 9092:9092 \
  --name kafka \
  --network workbench \
  docker.io/confluentinc/cp-server:5.5.1
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h nifi \
  -v nifi-conf:/opt/nifi/nifi-current/conf \
  -v nifi-content_repository:/opt/nifi/nifi-current/content_repository \
  -v nifi-database_repository:/opt/nifi/nifi-current/database_repository \
  -v nifi-flowfile_repository:/opt/nifi/nifi-current/flowfile_repository \
  -v nifi-logs:/opt/nifi/nifi-current/logs \
  -v nifi-provenance_repository:/opt/nifi/nifi-current/provenance_repository \
  -v nifi-state:/opt/nifi/nifi-current/state \
  -p 8080:8080 \
  --name nifi \
  --network workbench \
  docker.io/apache/nifi:1.11.4
```

```sh
curl -s 'http://127.0.0.1:8080/nifi-api/system-diagnostics' | jq
```

```sh
#
docker exec -i nifi /bin/sh -c 'curl -L https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.49.tar.gz | tar -xzC /opt/nifi/nifi-current/lib mysql-connector-java-5.1.49/mysql-connector-java-5.1.49.jar --strip-components 1'

#
docker restart nifi
```

> Wait! This process take a while.

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h nifi-registry \
  -p 18080:18080 \
  --name nifi-registry \
  --network workbench \
  docker.io/apache/nifi-registry:0.6.0
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h mysql \
  -v mysql-data:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD='root' \
  -e MYSQL_USER='debezium' \
  -e MYSQL_PASSWORD='debezium' \
  -e MYSQL_DATABASE='app' \
  -p 3306:3306 \
  --name mysql \
  --network workbench \
  docker.io/debezium/example-mysql:1.3
```

```sh
#
docker exec -i mysql /bin/sh -c 'echo "binlog_do_db = inventory" >> /etc/mysql/conf.d/mysql.cnf'

#
docker restart mysql

#
# docker exec -i mysql /usr/bin/mysql -D inventory -u debezium -p'debezium' -v <<-\EOSQL
# CREATE DATABASE `app`;
# USE app;
# EOSQL

#
# source /content/retail_db.sql
```

### Remove

```sh
docker rm -f zookeeper kafka nifi nifi-registry mysql

docker volume rm zookeeper-secrets zookeeper-data zookeeper-log kafka-secrets kafka-data nifi-conf nifi-content_repository nifi-database_repository nifi-flowfile_repository nifi-logs nifi-provenance_repository nifi-state mysql-data
```
