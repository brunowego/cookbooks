# scrumonline

<!--
https://github.com/chrisns/scrumonline/blob/master/README.md
-->

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

#### Bundled

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h scrumonline \
  -e HOST='http://127.0.0.1:8080' \
  -p 8080:80 \
  --name scrumonline \
  --network workbench \
  docker.io/chrisns/scrumonline:bundled-f3f5c3e20ff965968ddf907f198fc2d598bce751
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

```sh
# Remove
docker rm -f scrumonline
```

#### External MySQL

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h mysql \
  -e MYSQL_ROOT_PASSWORD='root' \
  -e MYSQL_USER='scrumonline' \
  -e MYSQL_PASSWORD='scrumonline' \
  -e MYSQL_DATABASE='scrumonline' \
  -v scrumonline-mysql-data:/var/lib/mysql \
  -p 3306:3306 \
  --name scrumonline-mysql \
  --network workbench \
  docker.io/library/mysql:5.7
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h scrumonline \
  -e DB_NAME='scrumonline' \
  -e DB_USER='scrumonline' \
  -e DB_PASS='scrumonline' \
  -e DB_HOST='scrumonline-mysql' \
  -e HOST='http://127.0.0.1:8080' \
  -p 8080:80 \
  --name scrumonline \
  --network workbench \
  docker.io/chrisns/scrumonline:latest-f3f5c3e20ff965968ddf907f198fc2d598bce751
```

```sh
docker exec -i scrumonline /bin/sh << EOSHELL
./vendor/bin/doctrine orm:schema-tool:create
./vendor/bin/doctrine orm:generate-proxies
EOSHELL
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

```sh
# Remove
docker rm -f scrumonline scrumonline-mysql

docker volume rm scrumonline-mysql-data
```
