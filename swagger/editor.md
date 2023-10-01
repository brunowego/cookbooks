# Swagger Editor

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
  -h swagger-editor \
  -p 8080:8080 \
  --name swagger-editor \
  --network workbench \
  docker.io/swaggerapi/swagger-editor:v3.6.36
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Remove

```sh
docker rm -f swagger-editor
```
