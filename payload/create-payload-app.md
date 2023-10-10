# Create Payload App

## Commands

```sh
npx create-payload-app -h
```

## Dependencies

```sh
#
docker network create workbench \
  --subnet 10.1.1.0/24

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

## Usage

```sh
#
npx create-payload-app \
  -n my-store \
  -t ecommerce \
  --use-pnpm

# postgres://payload:payload@127.0.0.1:5432/payload

#
cd ./my-store

#
pnpm dev
```
