# Redmine

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
  -e POSTGRES_USER=redmine \
  -e POSTGRES_PASSWORD=redmine \
  -e POSTGRES_DB=redmine \
  -v redmine-postgres-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name redmine-postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h redmine \
  -e REDMINE_DB_POSTGRES=redmine-postgres \
  -e REDMINE_DB_USERNAME=redmine \
  -e REDMINE_DB_PASSWORD=redmine \
  -e REDMINE_DB_DATABASE=redmine \
  -v redmine-files:/usr/src/redmine/files \
  -p 3000:3000 \
  --name redmine \
  --network workbench \
  docker.io/library/redmine:4.0.3
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:3000'
```

| Login | Password |
| --- | --- |
| `admin` | `admin` |

## Remove

```sh
docker rm -f redmine-postgres redmine
docker volume rm redmine-postgres-data redmine-files
```
