# Node-RED

## Links

- [Code Repository](https://github.com/node-red/node-red)
- [Main Website](https://nodered.org)

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
  -h node-red \
  -v node-red-data:/data \
  -p 1880:1880 \
  --name node-red \
  --network workbench \
  docker.io/nodered/node-red:latest
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:1880'
```

### Remove

```sh
docker rm -f node-red

docker volume rm node-red-data
```
