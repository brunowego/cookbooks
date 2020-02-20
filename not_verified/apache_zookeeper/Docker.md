# Docker

## Volume

```sh
docker volume create zookeeper-data
docker volume create zookeeper-log
```

## Running

```sh
docker run -d \
  -h zookeeper \
  -v zookeeper-data:/data \
  -v zookeeper-log:/datalog \
  -p 2182:2181 \
  --name zookeeper \
  zookeeper:3.5.5
```

## Remove

```sh
docker rm -f zookeeper
docker volume rm zookeeper-data zookeeper-log
```
