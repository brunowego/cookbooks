# Rundeck

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
  -e POSTGRES_USER=rundeck \
  -e POSTGRES_PASSWORD=rundeck \
  -e POSTGRES_DB=rundeck \
  -e TZ=America/Sao_Paulo \
  -v rundeck-postgres-data:/var/lib/postgresql/data \
  -v /etc/localtime:/etc/localtime:ro \
  -p 5432:5432 \
  --name rundeck-postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h rundeck \
  -e RUNDECK_GRAILS_URL=http://"127.0.0.1":4440 \
  -e RUNDECK_SERVER_ADDRESS=0.0.0.0 \
  -e RUNDECK_DATABASE_URL=jdbc:postgresql://rundeck-postgres:5432/rundeck \
  -e RUNDECK_DATABASE_DRIVER=org.postgresql.Driver \
  -e RUNDECK_DATABASE_USERNAME=rundeck \
  -e RUNDECK_DATABASE_PASSWORD=rundeck \
  -e TZ=America/Sao_Paulo \
  -v rundeck-config:/home/rundeck/server/config \
  -v rundeck-data:/home/rundeck/server/data \
  -v /etc/localtime:/etc/localtime:ro \
  -p 4440:4440 \
  --name rundeck \
  --network workbench \
  docker.io/rundeck/rundeck:3.0.21
```

### Remove

```sh
docker rm -f rundeck-postgres rundeck
docker volume rm rundeck-postgres-data rundeck-config rundeck-data
```
