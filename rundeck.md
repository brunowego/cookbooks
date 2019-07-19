# Rundeck

## Docker

### Volume

```sh
docker volume create rundeck-postgres-data
docker volume create rundeck-config
docker volume create rundeck-data
```

### Running

```sh
docker run -d \
  -h postgres.rundeck.local \
  -e POSTGRES_USER=rundeck \
  -e POSTGRES_PASSWORD=rundeck \
  -e POSTGRES_DB=rundeck \
  -e TZ=America/Sao_Paulo \
  -v rundeck-postgres-data:/var/lib/postgresql/data \
  -v /etc/localtime:/etc/localtime:ro \
  -p 5432:5432 \
  --name rundeck-postgres \
  --restart always \
  postgres:11.2-alpine
```

```sh
docker run -d \
  -h rundeck.local \
  -e RUNDECK_GRAILS_URL=http://"$(docker-machine ip)":4440 \
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
  --restart always \
  --link rundeck-postgres \
  rundeck/rundeck:3.0.21
```

### Remove

```sh
docker rm -f rundeck-postgres rundeck
docker volume rm rundeck-postgres-data rundeck-config rundeck-data
```
