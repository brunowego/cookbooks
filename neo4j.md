# Neo4j

## Links

- [Code Repository](https://github.com/neo4j/neo4j)
- [Main Website](https://neo4j.com/)

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
  -h neo4j \
  -e NEO4J_AUTH='neo4j/Pa$$w0rd!' \
  -p 7473:7473 \
  -p 7474:7474 \
  -p 7687:7687 \
  --name neo4j \
  --network workbench \
  docker.io/library/neo4j:4.3.5-community
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:7474'
```

### Remove

```sh
docker rm -f neo4j
```

## App

### Installation

#### Homebrew

```sh
brew cask install neo4j
```
