# Docker

## SQLite

```sh
docker run -it --rm \
  -v $(pwd):/usr/data/dump \
  emirozer/fake2db --rows 250 --db sqlite
```

## MySQL

```sh
docker run -d \
  -h mysql \
  -e MYSQL_ROOT_PASSWORD=root \
  --network host \
  --name mysql \
  --restart always \
  mysql:8.0
```

```sh
docker run -it --rm \
  --network host \
  emirozer/fake2db --rows 250 --db mysql --username root --password root
```

## PostgreSQL

```sh
docker run -d \
  -h postgres \
  -e POSTGRES_USER=root \
  -e POSTGRES_PASSWORD=root \
  --network host \
  --name postgres \
  --restart always \
  postgres:11.2-alpine
```

```sh
docker run -it --rm --network host emirozer/fake2db --rows 250 --db postgresql --username root --password root
```

## MongoDB

```sh
docker run -d \
  -h mongo \
  -e MONGO_INITDB_ROOT_USERNAME=root \
  -e MONGO_INITDB_ROOT_PASSWORD=root \
  --network host \
  --name mongo \
  --restart always \
  mongo:4.1
```

```sh
docker run -it --rm --network host emirozer/fake2db --rows 250 --db mongodb --name admin --username root --password root
```

## Redis

```sh
docker run -it --rm -v $(pwd):/usr/data/dump emirozer/fake2db --rows 250 --db redis
```

## CouchDB

```sh
docker run -it --rm --network host emirozer/fake2db --rows 250 --db couchdb --username root --password root
```
