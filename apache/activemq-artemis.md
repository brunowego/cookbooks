# Apache ActiveMQ Artemis

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
  -h activemq-artemis \
  -v activemq-artemis-config:/var/lib/artemis/etc \
  -v activemq-artemis-data:/var/lib/artemis/data \
  -v activemq-artemis-lock:/var/lib/artemis/lock \
  -v activemq-artemis-override:/var/lib/artemis/etc-override \
  -v activemq-artemis-tmp:/var/lib/artemis/tmp \
  -e ARTEMIS_USERNAME='admin' \
  -e ARTEMIS_PASSWORD='Pa$$w0rd!' \
  -p 8161:8161 \
  -p 61616:61616 \
  --name activemq-artemis \
  --network workbench \
  docker.io/vromero/activemq-artemis:2.16.0-alpine
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8161/console/'
```

### Remove

```sh
docker rm -f activemq-artemis

docker volume rm activemq-artemis-config activemq-artemis-data activemq-artemis-lock activemq-artemis-override activemq-artemis-tmp
```
