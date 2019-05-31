# Docker

## Volume

```sh
docker volume create kafka-zookeeper-data
docker volume create kafka-zookeeper-log
docker volume create kafka-data
```

## Running

```sh
docker run -d \
  -h zookeeper.kafka.local \
  -v kafka-zookeeper-data:/data \
  -v kafka-zookeeper-log:/datalog \
  -p 2182:2181 \
  --name kafka-zookeeper \
  --restart always \
  zookeeper:3.5.5
```

```sh
docker run -d \
  -h kafka.local \
  -e KAFKA_PORT=9092 \
  -e KAFKA_LISTENERS=PLAINTEXT://kafka:9092 \
  -e KAFKA_ZOOKEEPER_CONNECT=kafka-zookeeper:2181 \
  -e KAFKA_CREATE_TOPICS='example:4:1' \
  -v kafka-data:/var/lib/kafka/data \
  -p 9092:9092 \
  --name kafka \
  --restart always \
  --link kafka-zookeeper \
  wurstmeister/kafka:2.12-2.2.0
```

## Remove

```sh
docker rm -f kafka-zookeeper kafka
docker volume rm kafka-zookeeper-data kafka-zookeeper-log kafka-data
```
