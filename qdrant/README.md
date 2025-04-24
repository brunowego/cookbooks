# Qdrant

<!--
https://github.com/rag-web-ui/rag-web-ui
https://github.com/BCG-X-Official/agentkit
https://github.com/pynterest83/RAGChatApp
https://github.com/mazzasaverio/nextjs-fastapi-your-chat?tab=readme-ov-file
https://github.com/Rocketseat/houston/blob/main/docker-compose.yml
-->

**Keywords:** Vector Database, Vector Search Engine

## Links

- [Code Repository](https://github.com/qdrant/qdrant)

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
  -h qdrant \
  -v qdrant-data:/qdrant/storage \
  -p 6333:6333 \
  -p 6334:6334 \
  --name qdrant \
  --network workbench \
  docker.io/qdrant/qdrant:v1.13.6
```

<!--
http://localhost:6333/dashboard
-->

### Remove

```sh
docker rm -f qdrant

docker volume rm qdrant-data
```
