# Bytebase

## Links

- [Code Repository](https://github.com/bytebase/bytebase)
- [Demo](https://demo.bytebase.com/)

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
  -h bytebase \
  -v bytebase-data:/var/opt/bytebase \
  -p 8080:80 \
  --init \
  --restart always \
  --name bytebase \
  --network workbench \
  docker.io/bytebase/bytebase:0.3.0 --data /var/opt/bytebase
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Remove

```sh
docker rm -f bytebase

docker volume rm bytebase-data
```
