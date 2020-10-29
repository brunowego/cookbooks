# fake2db

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### SQLite

```sh
docker run -it --rm \
  -v $(pwd):/usr/data/dump \
  docker.io/emirozer/fake2db:latest --rows 250 --db sqlite
```

### MySQL

```sh
docker run -d \
  -h mysql \
  -e MYSQL_ROOT_PASSWORD=root \
  --network host \
  --name mysql \
  docker.io/library/mysql:8.0
```

```sh
docker run -it --rm \
  --network host \
  docker.io/emirozer/fake2db:latest \
    --rows 250 \
    --db mysql \
    --username root \
    --password root
```

### PostgreSQL

```sh
docker run -d \
  -h postgres \
  -e POSTGRES_USER=root \
  -e POSTGRES_PASSWORD=root \
  --network host \
  --name postgres \
  --network workbench \
  docker.io/library/postgres:11.2-alpine
```

```sh
docker run -it --rm \
  --network host \
  docker.io/emirozer/fake2db:latest \
    --rows 250 \
    --db postgresql \
    --username root \
    --password root
```

### MongoDB

```sh
docker run -d \
  -h mongo \
  -e MONGO_INITDB_ROOT_USERNAME='user' \
  -e MONGO_INITDB_ROOT_PASSWORD='pass' \
  --network host \
  --name mongo \
  docker.io/library/mongo:4.0.20
```

```sh
docker run -it --rm \
  --network host \
  docker.io/emirozer/fake2db:latest \
    --rows 250 \
    --db mongodb \
    --name admin \
    --username root \
    --password root
```

### Redis

```sh
docker run -it --rm \
  -v $(pwd):/usr/data/dump \
  docker.io/emirozer/fake2db:latest \
    --rows 250 \
    --db redis
```

### CouchDB

```sh
docker run -it --rm \
  --network host \
  docker.io/emirozer/fake2db:latest \
    --rows 250 \
    --db couchdb \
    --username root \
    --password root
```

## CLI

### Installation

#### PIP

```sh
pip install -U fake2db
```

### Commands

```sh
fake2db -h
```

### Examples

```sh
fake2db \
  --rows 250 \
  --db mysql \
  --host "127.0.0.1"
  --port 3306 \
  --username root \
  --password root
```
