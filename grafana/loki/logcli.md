# LogCLI

## Links

- [Docs](https://grafana.com/docs/loki/latest/getting-started/logcli/)

## Kubectl

### Running

```sh
kubectl run -it --rm \
  logcli \
  --image docker.io/grafana/logcli:main-236ed18-amd64 \
  --restart 'Never' \
  -- --help
```

## Docker

### Network

```sh
docker network create workbench \
  --subnet 10.1.1.0/24
```

### Running

```sh
docker run -i --rm \
  $(echo "$DOCKER_RUN_OPTS") \
  --network workbench \
  docker.io/grafana/logcli:main-236ed18-amd64 --help
```

## CLI

### Installation

#### Homebrew

```sh
brew install logcli
```

### Commands

```sh
logcli --help
```

### Usage

```sh
#
export LOKI_ADDR='http://localhost:3100'
export LOKI_USERNAME='[username]'
export LOKI_PASSWORD='[password]'

#
logcli labels
logcli labels namespace
logcli labels release

#
logcli query '{namespace="logging"}'

#
logcli series '{namespace="logging"}'
```
