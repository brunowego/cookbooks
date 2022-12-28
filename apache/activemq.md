# Apache ActiveMQ

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
  -h activemq \
  -v activemq-config:/opt/activemq/conf \
  -v activemq-data:/opt/activemq/data \
  -e TZ='America/Sao_Paulo' \
  -p 8161:8161 \
  -p 61616:61616 \
  --name activemq \
  --network workbench \
  docker.io/rmohr/activemq:5.15.9-alpine
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8161/admin/'
```

| Login   | Password |
| ------- | -------- |
| `admin` | `admin`  |

### Remove

```sh
docker rm -f activemq

docker volume rm activemq-config activemq-data
```

## CLI

### Installation

#### Homebrew

```sh
brew install activemq
```

### Services

```sh
brew services start activemq
```

### Commands

```sh
activemq -h
```

### Usage

```sh
#
activemq start
```
