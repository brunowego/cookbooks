# Svix

**Keywords:** Webhook Orchestration

## Links

- [Code Repository](https://github.com/svix/svix-webhooks/)
- [Main Website](https://svix.com)
- [Dashboard](https://dashboard.svix.com)
- [Status Page](https://status.svix.com)

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h redis \
  -v svix-redis-data:/data \
  -p 6379:6379 \
  --name svix-redis \
  --network workbench \
  docker.io/library/redis:7.0.8

#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h timescaledb \
  -e POSTGRES_USER='svix' \
  -e POSTGRES_PASSWORD='svix' \
  -e POSTGRES_DB='svix' \
  -v svix-timescaledb-data:/var/lib/postgresql/data \
  -p 5432:5432 \
  --name svix-timescaledb \
  --network workbench \
  docker.io/timescale/timescaledb:2.9.3-pg13

#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h svix-server \
  -e WAIT_FOR='true' \
  -e SVIX_JWT_SECRET='change_me' \
  -e SVIX_DB_DSN='postgresql://svix:svix@svix-timescaledb:5432/svix' \
  -e SVIX_REDIS_DSN='redis://svix-redis:6379' \
  -p 8071:8071 \
  --name svix-server \
  --network workbench \
  docker.io/svix/svix-server:v0.77
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8071'
```

### Remove

```sh
docker rm -f svix-redis svix-timescaledb svix-server

docker volume rm svix-redis-data svix-timescaledb-data
```

## CLI

### Installation

#### Homebrew

```sh
brew tap svix/svix
brew install svix
```

#### Scoop

```sh
scoop bucket add svix https://github.com/svix/scoop-svix.git
scoop install svix
```

### Commands

```sh
svix -h
```

<!-- ### Configuration

```sh
#
svix login

#
cat ~/.config/svix/config.toml
``` -->

<!-- ### Usage

```sh
#
svix listen http://localhost:8071/webhook

#
echo '{ "name": "demo" }' | svix application create

#
svix application list --limit 2 --iterator some_iterator
``` -->
