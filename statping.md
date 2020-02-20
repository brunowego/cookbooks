# Statping

**Keywords**: Status page

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h postgres \
  -e POSTGRES_USER='statping' \
  -e POSTGRES_PASSWORD='statping' \
  -e POSTGRES_DB='statping' \
  -v statping-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name statping-postgres \
  docker.io/library/postgres:11.2-alpine
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h statping \
  -e DB_CONN='postgres' \
  -e DB_HOST='statping-postgres' \
  -e DB_USER='statping' \
  -e DB_PASS='statping' \
  -e DB_DATABASE='statping' \
  -p 8080:8080 \
  --name statping \
  docker.io/hunterlong/statping:v0.80.65
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Remove

```sh
docker rm -f statping-postgres statping
docker volume rm statping-postgres-data
```
