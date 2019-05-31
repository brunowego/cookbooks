# Docker

## Volume

```sh
docker volume create percona-data
```

## Running

### 5.x

```sh
docker run -d \
  -h percona \
  -e MYSQL_ROOT_PASSWORD=root \
  -v percona-data:/var/lib/mysql \
  -p 3306:3306 \
  --name percona \
  --restart always \
  percona:5.7
```

### 8.x

```sh
docker run -d \
  -h percona \
  -e MYSQL_ROOT_PASSWORD=root \
  -v percona-data:/var/lib/mysql \
  -p 3306:3306 \
  --name percona \
  --restart always \
  percona:8.0 --default-authentication-plugin=mysql_native_password
```

## Client

```sh
docker exec -it \
  percona mysql \
    -h 127.0.0.1 \
    -P 3306 \
    -u root \
    -p'root'
```

## Utils

### Dump

```sh
docker exec -i percona mysqldump --help
```

```sh
docker run -it --rm \
  -v $(pwd)/dump:/dump \
  percona sh -c 'mysqldump \
    --column-statistics=0 \
    -h [hostname] \
    -P 3306 \
    -u root \
    -proot \
    [database] > /dump/[filename].sql'
```

### Import

```sh
docker exec -i percona mysqlimport --help
```

```sh
docker run -it --rm \
  -v $(pwd)/import:/import \
  percona sh -c 'mysqlimport \
    -h [hostname] \
    -P 3306 \
    -u root \
    -proot \
    [database] \
    /import/[filename].sql'
```

## Remove

```sh
docker rm -f percona
docker volume rm percona-data
```
