# Docker

## Running

```sh
docker run -d \
  -h kafka \
  -e KAFKA_PORT=9092 \
  -e KAFKA_LISTENERS=PLAINTEXT://kafka:9092 \
  -e KAFKA_ZOOKEEPER_CONNECT=zookeeper:2181 \
  -p 9092:9092 \
  --name kafka \
  --restart always \
  wurstmeister/kafka:latest
```
