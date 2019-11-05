# Cachet

## Docker

### Volumes

```sh
docker volume create cachet-postgres-data
docker volume create cachet-data
```

### Running

```sh
docker run -d \
  $(echo $DOCKER_RUN_OPTS) \
  -h postgres.example.com \
  -v cachet-postgres-data:/var/lib/postgresql/data \
  -e POSTGRES_USER=cachet \
  -e POSTGRES_PASSWORD=cachet \
  -e POSTGRES_DB=cachet \
  -p 5432:5432 \
  --name cachet-postgres \
  --restart always \
  postgres:11.2-alpine
```

```sh
docker run -d \
  $(echo $DOCKER_RUN_OPTS) \
  -h cachet.example.com \
  -v cachet-data:/var/www/html \
  -e DB_DRIVER=pgsql \
  -e DB_HOST=cachet-postgres \
  -e DB_PORT=5432 \
  -e DB_DATABASE=cachet \
  -e DB_USERNAME=cachet \
  -e DB_PASSWORD=cachet \
  -e APP_KEY='base64:9yh4xfdnr3v97K1h1PivuIZq2w4RpivWc00fVkUX2VI=' \
  -p 8000:8000 \
  --name cachet \
  --restart always \
  --link cachet-postgres \
  docker.io/cachethq/docker:2.3.15
```

```sh
echo -e "[INFO]\thttp://127.0.0.1:8000"
```

### Remove

```sh
docker rm -f cachet-postgres cachet
docker volume rm cachet-postgres-data cachet-data
```
