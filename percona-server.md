# Percona

## CLI

### Installation

#### Homebrew

```sh
brew install percona-server
```

## Docker

### Running

#### 5.x

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h percona \
  -e MYSQL_ROOT_PASSWORD=root \
  -v percona-data:/var/lib/mysql \
  -p 3306:3306 \
  --name percona \
  percona:5.7
```

#### 8.x

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h percona \
  -e MYSQL_ROOT_PASSWORD=root \
  -v percona-data:/var/lib/mysql \
  -p 3306:3306 \
  --name percona \
  percona:8.0 --default-authentication-plugin=mysql_native_password
```

### Client

```sh
docker exec -it \
  percona mysql \
    -h 127.0.0.1 \
    -P 3306 \
    -u root \
    -p'root'
```

### Utils

#### Dump

```sh
docker exec -i percona mysqldump --help
```

```sh
docker run -it --rm \
  -v $(pwd)/dump:/dump \
  docker.io/library/percona:latest sh -c 'mysqldump \
    --column-statistics=0 \
    -h [hostname] \
    -P 3306 \
    -u root \
    -p"root" \
    [database] > /dump/[filename].sql'
```

#### Import

```sh
docker exec -i percona mysqlimport --help
```

```sh
docker run -it --rm \
  -v $(pwd)/import:/import \
  docker.io/library/percona:latest sh -c 'mysqlimport \
    -h [hostname] \
    -P 3306 \
    -u root \
    -p"root" \
    [database] \
    /import/[filename].sql'
```

### Remove

```sh
docker rm -f percona
docker volume rm percona-data
```
