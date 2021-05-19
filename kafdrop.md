# Kafdrop

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
  -v kafka-zookeeper-data:/data \
  -v kafka-zookeeper-datalog:/datalog \
  -v kafka-zookeeper-logs:/logs \
  --name kafka-zookeeper \
  --network workbench \
  docker.io/library/zookeeper:3.5.6
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h kafka \
  -e KAFKA_PORT='9092' \
  -e KAFKA_LISTENERS='PLAINTEXT://kafka:9092' \
  -e KAFKA_ZOOKEEPER_CONNECT='kafka-zookeeper:2181' \
  -e KAFKA_CREATE_TOPICS='example:4:1' \
  -e KAFKA_JMX_OPTS='-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false -Djava.rmi.server.hostname=127.0.0.1 -Dcom.sun.management.jmxremote.rmi.port=1099' \
  -e JMX_PORT='1099' \
  -v kafka-data:/var/lib/kafka/data \
  -v kafka-logs:/kafka \
  -p 9092:9092 \
  -p 1099:1099 \
  --name kafka \
  --network workbench \
  docker.io/wurstmeister/kafka:2.12-2.4.1
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h kafdrop \
  -e KAFKA_BROKERCONNECT='kafka:9092' \
  -e JVM_OPTS="-Xms32M -Xmx64M" \
  -e SERVER_SERVLET_CONTEXTPATH="/" \
  -p 9000:9000 \
  --name kafdrop \
  --network workbench \
  docker.io/obsidiandynamics/kafdrop:3.27.0
```

> Wait! This process take a while.

```sh
echo -e '[INFO]\thttp://127.0.0.1:9000'
```

### Remove

```sh
docker rm -f kafka-zookeeper kafka kafdrop

docker volume rm kafka-zookeeper-data kafka-zookeeper-datalog kafka-zookeeper-logs kafka-data kafka-logs
```
