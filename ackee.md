# Ackee

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
  -h mongo \
  -v ackee-mongo-data:/data/db \
  -e MONGO_INITDB_DATABASE=ackee \
  -p 27017:27017 \
  --name ackee-mongo \
  docker.io/library/mongo:4.0.20
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h ackee \
  -e ACKEE_MONGODB=mongodb://ackee-mongo:27017/ackee \
  -e ACKEE_USERNAME=admin \
  -e ACKEE_PASSWORD=admin \
  -p 3000:3000 \
  --name ackee \
  docker.io/electerious/ackee:1.4.0
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:3000'
```

### Remove

```sh
docker rm -f ackee-mongo ackee
docker volume rm ackee-mongo-data
```
