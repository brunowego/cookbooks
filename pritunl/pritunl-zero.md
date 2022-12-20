# Pritunl Zero

## Links

- [Code Repository](https://github.com/pritunl/pritunl-zero)
- [Main Website](https://zero.pritunl.com)

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
  -h mongodb \
  -v pritunl-zero-mongodb-data:/data/db \
  -v pritunl-zero-mongodb-configdb:/data/configdb \
  -e MONGO_INITDB_DATABASE='pritunl' \
  -p 27017:27017 \
  --name pritunl-zero-mongodb \
  --network workbench \
  docker.io/library/mongo:4.4.6

#
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h pritunl-zero \
  -e MONGO_URI='mongodb://pritunl-zero-mongodb:27017/pritunl' \
  -e NODE_ID='5b8e11e4610f990034635e98' \
  -p 80:80 \
  -p 443:443 \
  --name pritunl-zero \
  --network workbench \
  docker.io/pritunl/pritunl-zero:1.0.2019.78
```

```sh
#
docker exec -i pritunl-zero pritunl-zero default-password

#
echo -e '[INFO]\thttps://127.0.0.1'
```

### Remove

```sh
docker rm -f \
  pritunl-zero-mongodb \
  pritunl-zero

docker volume rm \
  pritunl-zero-mongodb-configdb \
  pritunl-zero-mongodb-data
```
