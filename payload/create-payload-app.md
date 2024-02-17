# Create Payload App

## Commands

```sh
bunx create-payload-app -h
```

## Dependencies

```sh
#
docker network create workbench \
  --subnet 10.1.1.0/24
```

### MongoDB

```sh
#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h mongodb \
  -v mongodb-data:/data/db \
  -v mongodb-configdb:/data/configdb \
  -e MONGO_INITDB_ROOT_USERNAME='payload' \
  -e MONGO_INITDB_ROOT_PASSWORD='payload' \
  -e MONGO_INITDB_DATABASE='payload' \
  -p 27017:27017 \
  --name payload-mongodb \
  --network workbench \
  docker.io/library/mongo:7.0.5-jammy
```

<!--
mongodb://payload:payload@localhost:5432/payload
-->

### PostgreSQL

```sh
#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h postgresql \
  -e POSTGRES_USER='payload' \
  -e POSTGRES_PASSWORD='payload' \
  -e POSTGRES_DB='payload' \
  -v postgresql-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name payload-postgresql \
  --network workbench \
  docker.io/library/postgres:15.1-alpine
```

<!--
postgres://payload:payload@localhost:5432/payload
-->

## Usage

<!--
https://github.com/payloadcms/payload/tree/main/templates
-->

```sh
#
bunx create-payload-app \
  -n cms \
  --use-pnpm
```
