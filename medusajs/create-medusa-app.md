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
  -h redis \
  -v medusa-redis-data:/data \
  -p 6379:6379 \
  --name medusa-redis \
  --network workbench \
  docker.io/library/redis:7.0.8

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

**Note:** pnpm is not supported yet.

```sh
#
mkdir ./app && cd "$_"

#
npx create-medusa-app@latest \
  --seed \
  --db-url 'postgres://medusa:medusa@127.0.0.1:5432/medusa' \
  --no-browser \
  ./

# With Next.js Starter
npx create-medusa-app@latest \
  --seed \
  --db-url 'postgres://medusa:medusa@127.0.0.1:5432/medusa' \
  --no-browser \
  --with-nextjs-starter \
  ./
```

## Configuration

**Refer:** `./.env` (app)

```env
OPEN_BROWSER=false

JWT_SECRET=S3cr3t_K@Key
COOKIE_SECRET=S3cr3t_K@Key
```

## Extend

- [Redis](./extend/redis.md) (Event Bus and Cache Service)
- Notification Provider
  - [Nodemailer](./extend/nodemailer.md)
  - [SendGrid](./extend/sendgrid.md)
  - [SMTP](./extend/smtp.md)

## Running

```sh
#
cd ./app

#
medusa migrations run

#
medusa seed -f ./data/seed.json

#
yarn dev
```

## Services

| Service          | URL                   |
| ---------------- | --------------------- |
| Medusa Dashboard | http://localhost:7001 |

## Remove

```sh
docker rm -f medusa-redis medusa-postgresql

docker volume rm medusa-redis-data medusa-postgresql-data
```
