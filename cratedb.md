# CrateDB

## Docker

### Running

```sh
docker-machine ssh $DOCKER_MACHINE_NAME sudo sysctl -w vm.max_map_count=262144
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h cratedb \
  -e CRATE_HEAP_SIZE=1g \
  -v cratedb-config:/crate/config \
  -v cratedb-data:/data \
  -p 4200:4200 \
  -p 4300:4300 \
  -p 5432:5432 \
  --name cratedb \
  crate:3.3
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:4200'
```

### Remove

```sh
docker rm -f cratedb
docker volume rm cratedb-config cratedb-data
```
