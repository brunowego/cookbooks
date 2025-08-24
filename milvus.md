# Milvus

**Keywords:** Vector Database, Vector Search Engine

## Link

- [Code Repository](https://github.com/milvus-io/milvus)
- [Main Website](https://milvus.io)

## Docker

### Links

- [Run Milvus in Docker (Linux)](https://milvus.io/docs/install_standalone-docker.md)

<!--
https://raw.githubusercontent.com/milvus-io/milvus/master/scripts/standalone_embed.sh
-->

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h milvus \
  -e ETCD_USE_EMBED='true' \
  -e COMMON_STORAGETYPE='local' \
  -e DEPLOY_MODE='STANDALONE' \
  -p 2379:2379 \
  -p 9091:9091 \
  -p 19530:19530 \
  --name milvus \
  --network workbench \
  docker.io/milvusdb/milvus:v2.6.0 milvus run standalone
```

<!--
http://127.0.0.1:9091/webui
-->

### Remove

```sh
docker rm -f milvus

# docker volume rm milvus-data
```
