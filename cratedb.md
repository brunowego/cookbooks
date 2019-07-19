# CrateDB

## Docker

### Volume

```sh
docker volume create cratedb-config
docker volume create cratedb-data
```

### Running

```sh
docker-machine ssh $DOCKER_MACHINE_NAME sudo sysctl -w vm.max_map_count=262144
```

```sh
docker run -d \
  -h cratedb \
  -e CRATE_HEAP_SIZE=1g \
  -v cratedb-config:/crate/config \
  -v cratedb-data:/data \
  -p 4200:4200 \
  -p 4300:4300 \
  -p 5432:5432 \
  --name cratedb \
  --restart always \
  crate:3.3
```

```sh
echo -e "[INFO]\thttp://$(docker-machine ip):4200"
```

### Remove

```sh
docker rm -f cratedb
docker volume rm cratedb-config cratedb-data
```
