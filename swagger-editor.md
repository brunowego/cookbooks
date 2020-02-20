# Swagger Editor

## Docker

### Running

```sh
docker run -d \
  -h swagger-editor \
  -p 8080:8080 \
  --name swagger-editor \
  docker.io/swaggerapi/swagger-editor:v3.6.36
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Remove

```sh
docker rm -f swagger-editor
```
