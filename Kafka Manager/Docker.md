# Docker

## Running

```sh
docker run -d \
  -h kafka-manager \
  -e ZK_HOSTS=zookeeper:2181 \
  -p 9000:9000 \
  --name kafka-manager \
  --restart always \
  hlebalbau/kafka-manager:latest
```
