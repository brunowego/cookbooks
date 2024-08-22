# Dragonfly

**Keywords:** Redis API-compatible, Memcached API-compatible

## Links

- [Code Repository](https://github.com/dragonflydb/dragonfly)
- [Main Website](https://dragonflydb.io)

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
  -h dragonfly \
  -v dragonfly-data:/data \
  -p 6379:6379 \
  --name dragonfly \
  --network workbench \
  --ulimit memlock=-1 \
  docker.dragonflydb.io/dragonflydb/dragonfly:latest
```

```env
#
REDIS_URL=redis://127.0.0.1:6379/0

#
REDIS_URL=redis://:redis@127.0.0.1:6379/0
```

### Remove

```sh
docker rm -f dragonfly

docker volume rm dragonfly-data
```
