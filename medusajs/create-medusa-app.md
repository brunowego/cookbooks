# Create Medusa App

<!--
admin
backend
storefront
-->

## Links

- [Docs](https://docs.medusajs.com/create-medusa-app)

## Commands

```sh
npx create-medusa-app@latest -h
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
  -e POSTGRES_USER='medusa' \
  -e POSTGRES_PASSWORD='medusa' \
  -e POSTGRES_DB='medusa' \
  -v medusa-postgresql-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name medusa-postgresql \
  --network workbench \
  docker.io/library/postgres:15.1-alpine
```

## Usage

```sh
#
mkdir ./<store-name> && cd "$_"

#
npx create-medusa-app@latest \
  --seed \
  --db-url 'postgres://medusa:medusa@127.0.0.1:5432/medusa' \
  ./

# With Next.js Starter
npx create-medusa-app@latest \
  --seed \
  --db-url 'postgres://medusa:medusa@127.0.0.1:5432/medusa' \
  --with-nextjs-starter \
  ./
```

<!--
redis_url
jwt_secret
cookie_secret
-->

## Services

| Service          | URL                   |
| ---------------- | --------------------- |
| Medusa Dashboard | http://localhost:7001 |

## Remove

```sh
docker rm -f medusa-postgresql

docker volume rm medusa-postgresql-data
```
