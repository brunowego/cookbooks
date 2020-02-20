# Chatwoot

**Keywords**: Live chat

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h postgres \
  -e POSTGRES_USER='chatwoot' \
  -e POSTGRES_PASSWORD='chatwoot' \
  -e POSTGRES_DB='chatwoot' \
  -v chatwoot-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name chatwoot-postgres \
  docker.io/library/postgres:11.2-alpine
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h chatwoot \
  -e POSTGRES_HOST='chatwoot-postgres' \
  -e POSTGRES_USERNAME='chatwoot' \
  -e POSTGRES_PASSWORD='chatwoot' \
  -e POSTGRES_DATABASE='chatwoot' \
  -p 3000:3000 \
  --name chatwoot \
  chatwoot/chatwoot:latest
```

```sh
docker exec chatwoot rails db:migrate
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:3000'
```

### Remove

```sh
docker rm -f chatwoot-postgres chatwoot
docker volume rm chatwoot-postgres-data
```
