# Wekan

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h mongo \
  -v wekan-mongo-data:/data/db \
  -e MONGO_INITDB_DATABASE=wekan \
  -p 27017:27017 \
  --name wekan-mongo \
  docker.io/library/mongo:4.0.20
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h wekan \
  -e ROOT_URL=http://0.0.0.0:8080 \
  -e MONGO_URL=mongodb://wekan-mongo:27017/wekan \
  -p 8080:8080 \
  --name wekan \
  docker.io/wekanteam/wekan:v2.75
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Remove

```sh
docker rm -f wekan-mongo wekan
docker volume rm wekan-mongo-data
```
