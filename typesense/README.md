# Typesense

<!--
https://www.youtube.com/watch?v=cIU19iA8I7U

https://github.com/tradingstrategy-ai/search/blob/main/schemas/trading-entities.json
-->

**Keywords:** Search Engine

## Links

- [Code Repository](https://github.com/typesense/typesense)
- [Main Website](https://typesense.org)
- [Docs](https://typesense.org/docs)
  - [Syncing Data into Typesense](https://typesense.org/docs/guide/syncing-data-into-typesense.html)

## Articles

- [Compare Algolia vs ElasticSearch vs Meilisearch vs Typesense](https://typesense.org/typesense-vs-algolia-vs-elasticsearch-vs-meilisearch/)

## Tools

- [Typesense Dashboard (typesense-dashboard)](https://github.com/bfritscher/typesense-dashboard)
- [Airbyte / Open-source ETL to Typesense](https://airbyte.com/connectors/typesense)

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
  -h typesense \
  -v typesense-data:/data \
  -e TYPESENSE_API_KEY='S3cr3t_K@Key' \
  -e TYPESENSE_DATA_DIR='/data' \
  -p 8108:8108 \
  --name typesense \
  --network workbench \
  docker.io/typesense/typesense:0.24.1
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8108/health'
```

### Remove

```sh
docker rm -f typesense

docker volume rm typesense-data
```

## CLI

### Installation

#### Homebrew

```sh
brew tap typesense/tap
brew install typesense-server
```

### Services

```sh
# Homebrew
brew services start typesense-server

#
curl -s http://localhost:8108/health | jq

# Homebrew
brew services stop typesense-server
```
