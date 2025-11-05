# Langfuse

<!--
https://github.com/lucagrippa/md2anki
https://github.com/0xinhua/joychat
https://github.com/PerfLab-io/perfagent
https://github.com/CloudCruise/BATS
https://github.com/orctane/opentools
https://github.com/youngchingjui/issue-to-pr
https://github.com/lukai-app/lukai
-->

**Keywords:** LLM

## Links

- [Code Repository](https://github.com/langfuse/langfuse)
- [Main Website](https://langfuse.com)
- Docs
  - [Migrate Langfuse v2 to v3](https://langfuse.com/self-hosting/upgrade-guides/upgrade-v2-to-v3)
  - [Configuration](https://langfuse.com/self-hosting/configuration)

<!--
https://langfuse.com/docs/prompt-management/features/github-integration
-->

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

### Issues

#### TBD

```log
Failed to prepare server TypeError: Cannot set property message of ZodError which has only a getter
    at NextNodeServer.prepareImpl (/app/node_modules/.pnpm/next@14.2.30_@babel+core@7.24.3_@opentelemetry+api@1.9.0_@playwright+test@1.47.2_babel-plugin_pz5jczsrwmn5olwahiiemkgmoy/node_modules/next/dist/server/next-server.js:481:33)
```

<!--
https://github.com/langfuse/langfuse/issues/7995
https://github.com/langfuse/langfuse/issues/4675
https://github.com/langfuse/langfuse/issues/8472
-->

<!--
Perhaps a variable without a value. ZodError.
-->

TODO

#### TBD

```log
2025-08-18T23:53:18.562Z error  prisma:error Error in PostgreSQL connection: Error { kind: Db, cause: Some(DbError { severity: "FATAL", parsed_severity: Some(Fatal), code: SqlState(E57P01), message: "terminating connection due to administrator command", detail: None, hint: None, position: None, where_: None, schema: None, table: None, column: None, datatype: None, constraint: None, file: Some("postgres.c"), line: Some(3315), routine: Some("ProcessInterrupts") }) }
```

<!--
docker logs -f with-ai-sdk-model-usage-langfuse-1
-->

### Remove

```sh
docker rm -f langfuse-postgres langfuse-clickhouse langfuse-redis langfuse

docker volume rm langfuse-postgres-data langfuse-clickhouse-config langfuse-clickhouse-data langfuse-redis-data
```
