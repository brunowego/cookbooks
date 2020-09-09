# Moodle

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
  -h mysql \
  -e MYSQL_ROOT_PASSWORD='root' \
  -e MYSQL_USER='moodle' \
  -e MYSQL_PASSWORD='moodle' \
  -e MYSQL_DATABASE='moodle' \
  -v moodle-mysql-data:/var/lib/mysql \
  -p 3306:3306 \
  --name moodle-mysql \
  --network workbench \
  docker.io/library/mysql:5.7
```

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h moodle \
  -e MOODLE_DATABASE_TYPE='mysqli' \
  -e MOODLE_DATABASE_HOST='moodle-mysql' \
  -e MOODLE_DATABASE_NAME='moodle' \
  -e MOODLE_DATABASE_USER='moodle' \
  -e MOODLE_DATABASE_PASSWORD='moodle' \
  -e ALLOW_EMPTY_PASSWORD='yes' \
  -p 8080:8080 \
  --name moodle \
  --network workbench \
  docker.io/bitnami/moodle:3.9.1
```

> Wait! This process take a while.

```sh
docker logs -f moodle | sed '/** Moodle setup finished! **/ q'
```

```sh
# Open
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Remove

```sh
docker rm -f moodle-mysql moodle
docker volume rm moodle-mysql-data
```
