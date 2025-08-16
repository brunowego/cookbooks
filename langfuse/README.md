# Langfuse

**Keywords:** LLM

## Links

- [Code Repository](https://github.com/langfuse/langfuse)
- [Main Website](https://langfuse.com)
- Docs
  - [Migrate Langfuse v2 to v3](https://langfuse.com/self-hosting/upgrade-guides/upgrade-v2-to-v3)
  - [Configuration](https://langfuse.com/self-hosting/configuration)

## Features

- Comprehensive API
- Datasets
- Evaluations
- LLM Application Observability
- LLM Playground
- Prompt Management

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
  -h postgres \
  -v langfuse-postgres-data:/var/lib/postgresql/data \
  -e POSTGRES_USER='langfuse' \
  -e POSTGRES_PASSWORD='langfuse' \
  -e POSTGRES_DB='langfuse' \
  -p 15432:5432 \
  --name langfuse-postgres \
  --network workbench \
  docker.io/library/postgres:17.5-alpine

#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h clickhouse \
  -v langfuse-clickhouse-config:/etc/clickhouse-server \
  -v langfuse-clickhouse-data:/var/lib/clickhouse \
  -e CLICKHOUSE_DB='langfuse' \
  -e CLICKHOUSE_USER='langfuse' \
  -e CLICKHOUSE_PASSWORD='langfuse' \
  -p 8123:8123 \
  -p 9000:9000 \
  -p 9009:9009 \
  --name langfuse-clickhouse \
  --network workbench \
  --ulimit nofile=262144:262144 \
  docker.io/clickhouse/clickhouse-server:25.7.4-alpine

#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h redis \
  -v langfuse-redis-data:/data \
  -p 6379:6379 \
  --name langfuse-redis \
  --network workbench \
  --entrypoint /bin/sh \
  docker.io/library/redis:7.0.7

#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h langfuse \
  -e DATABASE_URL='postgresql://langfuse:langfuse@langfuse-postgres:5432/langfuse' \
  -e NEXTAUTH_SECRET='c1865bad9000ce05be89cf5462e34bf3a36add6bb51fc6a15180e1e425631ac7' \
  -e NEXTAUTH_URL='http://langfuse:3000' \
  -e SALT='6b43c21be0ade3e4393f84da4a34e882381ffd512db2fe46480f51b3ce180480' \
  -e CLICKHOUSE_URL='http://langfuse-clickhouse:8123' \
  -e CLICKHOUSE_USER='langfuse' \
  -e CLICKHOUSE_PASSWORD='langfuse' \
  -e CLICKHOUSE_MIGRATION_URL='clickhouse://langfuse-clickhouse:9000' \
  -e CLICKHOUSE_CLUSTER_ENABLED=false \
  -e REDIS_CONNECTION_STRING='redis://langfuse-redis:6379' \
  -e REDIS_PASSWORD='langfuse' \
  -e REDIS_TLS_ENABLED=false \
  -e LANGFUSE_ENABLE_EXPERIMENTAL_FEATURES=true \
  -p 13000:3000 \
  --name langfuse \
  --network workbench \
  docker.io/langfuse/langfuse:3.98
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:13000'
```

### Remove

```sh
docker rm -f langfuse-postgres langfuse-clickhouse langfuse-redis langfuse

docker volume rm langfuse-postgres-data langfuse-clickhouse-config langfuse-clickhouse-data langfuse-redis-data
```
