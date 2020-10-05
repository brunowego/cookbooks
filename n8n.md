# n8n

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
  -h postgres \
  -e POSTGRES_USER=n8n \
  -e POSTGRES_PASSWORD=n8n \
  -e POSTGRES_DB=n8n \
  -v n8n-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name n8n-postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h n8n \
  -e N8N_BASIC_AUTH_ACTIVE=true \
  -e N8N_BASIC_AUTH_USER=admin \
  -e N8N_BASIC_AUTH_PASSWORD=admin \
  -e DB_TYPE=postgresdb \
  -e DB_POSTGRESDB_HOST=n8n-postgres \
  -e DB_POSTGRESDB_PORT=5432 \
  -e DB_POSTGRESDB_USER=n8n \
  -e DB_POSTGRESDB_PASSWORD=n8n \
  -e DB_POSTGRESDB_DATABASE=n8n \
  -p 5678:5678 \
  --name n8n \
  --network workbench \
  docker.io/n8nio/n8n:0.37.0
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:5678'
```

### Remove

```sh
docker rm -f n8n-postgres n8n
docker volume rm n8n-postgres-data
```
