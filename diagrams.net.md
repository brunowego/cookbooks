# diagrams.net (p.k.a. draw.io)

## Links

- [Main Website](https://diagrams.net)

## App

### Installation

#### Homebrew

```sh
brew install --cask drawio
```

### Structure

```sh
#
mkdir -p ./.drawio/exported

#
touch ./.drawio/app.drawio
```

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
  -h drawio \
  -p 8080:8080 \
  -p 8443:8443 \
  --name drawio \
  --network workbench \
  docker.io/jgraph/drawio:12.3.3-alpine
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Remove

```sh
docker rm -f drawio
```
