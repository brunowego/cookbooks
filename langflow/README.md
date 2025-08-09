# Langflow

<!--
path:docker-compose.y content:langflow
-->

**Keywords:**

## Links

- [Main Website](https://langflow.org)
- [Docker Image](https://hub.docker.com/r/langflowai/langflow)

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
  -v langflow-postgres-data:/var/lib/postgresql/data \
  -e POSTGRES_USER='langflow' \
  -e POSTGRES_PASSWORD='langflow' \
  -e POSTGRES_DB='langflow' \
  -p 5432:5432 \
  --name langflow-postgres \
  --network workbench \
  docker.io/library/postgres:17.5-alpine

#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h langflow \
  -e LANGFLOW_DATABASE_URL='postgresql://langflow:langflow@langflow-postgres:5432/langflow' \
  -p 17860:7860 \
  --name langflow \
  --network workbench \
  docker.io/langflowai/langflow:1.5.0
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:17860'
```

### Remove

```sh
docker rm -f langflow-postgres langflow
docker volume rm langflow-postgres-data
```

## App

### Installation

```sh
#
brew install --cask langflow
```
