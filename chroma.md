# Chroma

**Keywords:** Vector Database, Vector Search Engine, DuckDB

<!--
https://github.com/thakkaryash94/chroma-ui | https://chroma-ui.vercel.app
-->

## Links

- [Code Repository](https://github.com/chroma-core/chroma)
- [Main Website](https://trychroma.com)

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h chroma \
  -v chroma-data:/chroma/chroma \
  -p 8000:8000 \
  --name chroma \
  --network workbench \
  docker.io/chromadb/chroma:1.0.5
```

<!--
http://localhost:8000/api/v2
-->

<!--
docker cp chroma:/chroma/chroma/chroma.db .
-->

### Remove

```sh
docker rm -f chroma

docker volume rm chroma-data
```
