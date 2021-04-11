# PHP Apache (HTTPd)

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
  -h php-apache \
  -p 8080:80 \
  --name php-apache \
  --network workbench \
  docker.io/library/php:7.4-apache
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Remove

```sh
docker rm -f php-apache
```
