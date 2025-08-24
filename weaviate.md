# Weaviate

**Keywords:** Vector Database, Vector Search Engine

## Links

- [Code Repository](https://github.com/weaviate/weaviate)
- [Main Website](https://weaviate.io)

## Docker

### Links

- [Installation](https://docs.weaviate.io/deploy/installation-guides/docker-installation)

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h weaviate \
  -e QUERY_DEFAULTS_LIMIT=25 \
  -e AUTHENTICATION_ANONYMOUS_ACCESS_ENABLED='true' \
  -e PERSISTENCE_DATA_PATH='/var/lib/weaviate' \
  -e ENABLE_API_BASED_MODULES='true' \
  -e CLUSTER_HOSTNAME='node1' \
  -v weaviate-data:/var/lib/weaviate \
  -p 8080:8080 \
  -p 50051:50051 \
  --name weaviate \
  --network workbench \
  docker.io/semitechnologies/weaviate:1.32.4
```

<!--
http://localhost:50051
-->

<!--
curl -X GET 'http://localhost:8080'
-->

<!--
Non-official UI

https://github.com/naaive/weaviate-ui
-->

### Remove

```sh
docker rm -f weaviate

docker volume rm weaviate-data
```
