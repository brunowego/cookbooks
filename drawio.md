# draw.io

## CLI

### Installation

#### Homebrew

```sh
brew cask install drawio
```

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h drawio \
  -p 8080:8080 \
  -p 8443:8443 \
  --name drawio \
  docker.io/jgraph/drawio:12.3.3-alpine
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:8080'
```

### Remove

```sh
docker rm -f drawio
```
