# Sysdig

## Docker

### Running

```sh
docker run -d \
  $(echo "$DOCKER_RUN_OPTS") \
  -h sysdig-inspect \
  -v sysdig-inspect-captures:/captures
  -p 3000:3000 \
  --name sysdig-inspect \
  docker.io/sysdig/sysdig-inspect:0.4.2
```

```sh
echo -e '[INFO]\thttp://127.0.0.1:3000'
```

### Remove

```sh
docker rm -f sysdig-inspect

docker volume rm sysdig-inspect-captures
```

## CLI

### Installation

#### Homebrew

```sh
brew install sysdig
```

### Commands

```sh
sysdig -h
```
